// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "sim-idx-generated/Generated.sol";
import "./interfaces/IClankerTokenV4_0.sol";
import "./interfaces/IClankerV4_0.sol";
import "./interfaces/IV4Quoter.sol";
import "./interfaces/IUniswapV3Pool.sol";
import "./lib/MulDiv.sol";

/// Index Transfer events from the ClankerTokenV4_0 contract
/// This listener captures all token transfer events for tracking and analysis
contract ClankerTokenV4_0Listener is ClankerTokenV4_0$OnTransferEvent {
    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.

    address constant CLANKER_V4_0_0_BASE =
        0xE85A59c628F7d27878ACeB4bf3b35733630083a9;
    address constant CLANKER_V3_1_FACTORY_BASE =
        0x2A787b2362021cC3eEa3C24C4748a6cD5B687382;
    address constant UNISWAP_V4_POOLMANAGER_BASE =
        0x498581fF718922c3f8e6A244956aF099B2652b2b;
    address constant WETH_BASE = 0x4200000000000000000000000000000000000006;
    address constant USDC_BASE = 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913;
    address constant UNISWAP_V4_QUOTER_BASE =
        0x0d5e0F971ED27FBfF6c2837bf31316121532048D;
    uint256 constant MINIMUM_ETH_VALUE = 0.001 ether;

    // Uniswap V3 addresses (BASE)
    // Uniswap v3 WETH/USDC 0.30% pool (Base):
    address constant UNISWAP_V3_POOL_WETH_USDC_BASE = 0x6c561B446416E1A00E8E93E221854d6eA4171372;

    // from https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/libraries/LPFeeLibrary.sol#L15
    uint24 public constant DYNAMIC_FEE_FLAG = 0x800000;

    struct TransferData {
        address fromAddress;
        address toAddress;
        address token;
        address factory; // detected factory that deployed the token
        uint8 factoryVersion; // 3 or 4
        uint256 value;
        uint256 ethValueInWei;
        uint256 usdcValue;
        bytes32 txHash;
        string tokenContext;
        uint256 blockNumber;
        uint256 blockTimestamp;
        bool sell;
    }  

    // from https://github.com/Uniswap/v4-core/src/types/PoolKey.sol
    struct PoolKey {
        address currency0;
        address currency1;
        uint24 fee;
        int24 tickSpacing;
        address hooks;
    }

    event Transfer(TransferData);



    /// @notice Error thrown when the token is not a retaketv token
    /// @dev Its selector is 0xa3729561.
    error NotARetaketvToken();

    error AmountTooLow(uint256 amount, uint256 minAmount);

    event QuoterError(string reason);
    event QuoterLowLevelError(bytes data);

    /// @notice Modifier to check if the token is a retaketv token
    /// @dev this modifier checks if the token context contains "streamm deployment".
    modifier onlyRetaketvToken(EventContext memory ctx) {
        string memory tokenContext = IClankerTokenV4_0(ctx.txn.call.callee())
            .context();
        require(containsStreammDeployment(tokenContext), NotARetaketvToken());
        _;
    }


    /// The handler called whenever the ClankerTokenV4_0 Transfer event is emitted.
    /// Within here you write your indexing specific logic (e.g., call out to other contracts to get more information).
    /// The only requirement for handlers is that they have the correct signature, but usually you will use generated interfaces to help write them.
    function onTransferEvent(
        EventContext memory ctx,
        ClankerTokenV4_0$TransferEventParams memory inputs
    ) external override onlyRetaketvToken(ctx) {
        // get token context for dev purposes. Via modifier we're already filtering any that don't contain "streamm deployment".
        string memory tokenContext = IClankerTokenV4_0(ctx.txn.call.callee())
            .context();
        
        // detect factory + version (v4 preferred via tokenDeploymentInfo, fallback to v3.1)
        (address factory, uint8 factoryVersion, address v4Hook) = detectFactoryAndHook(ctx.txn.call.callee());

        // compute value only for v4 (v3.1 launches on Uniswap v3; this listener quotes v4 via hook)
        uint256 ethValueInWei = 0;
        uint256 usdcValue = 0;
        if (factoryVersion == 4) {
            ethValueInWei = getValueInEth(ctx.txn.call.callee(), v4Hook, inputs.value);
            require(ethValueInWei >= MINIMUM_ETH_VALUE, AmountTooLow(ethValueInWei, MINIMUM_ETH_VALUE));
            usdcValue = getValueInUsdc(ethValueInWei);
        }

        TransferData memory data = TransferData({
            fromAddress: inputs.from,
            toAddress: inputs.to,
            token: ctx.txn.call.callee(),
            value: inputs.value,
            factory: factory,
            factoryVersion: factoryVersion,
            ethValueInWei: ethValueInWei,
            usdcValue: usdcValue,
            txHash: ctx.txn.hash(),
            tokenContext: tokenContext,
            blockNumber: block.number,
            blockTimestamp: block.timestamp,
            sell: ctx.txn.call.caller() == inputs.from
        });

        emit Transfer(data);
    }

    function getValueInUsdc(uint256 amountWei) internal returns (uint256 amountUsdc) {
        IUniswapV3Pool pool = IUniswapV3Pool(UNISWAP_V3_POOL_WETH_USDC_BASE);
        
        (uint160 sqrtPriceX96,, , , , ,) = pool.slot0();
        uint256 priceX192 = uint256(sqrtPriceX96) * uint256(sqrtPriceX96); // Q192

        address t0 = pool.token0();
        address t1 = pool.token1();

        // Sanity: pool must be exactly WETH/USDC in either order
        require(
            (t0 == WETH_BASE && t1 == USDC_BASE) || (t0 == USDC_BASE && t1 == WETH_BASE),
            "Unexpected pool tokens"
        );

        // Compute USDC (6 decimals) output for the given ETH wei input.
        // NOTE: Uniswap v3 price math already uses raw token units, so no extra
        // decimal scaling is needed beyond the Q192 divide/inverse.
        if (t0 == WETH_BASE) {
            // price is USDC per WETH in Q192
            amountUsdc = MulDiv.mulDiv(amountWei, priceX192, 1 << 192);
        } else {
            // price is WETH per USDC in Q192 => invert
            // amountUSDC = amountWei / (WETH per USDC)
            //           = amountWei * 2^192 / priceX192
            amountUsdc = MulDiv.mulDiv(amountWei, 1 << 192, priceX192);
        }
    }

    function getValueInEth(
        address token,
        address hook,
        uint256 amount
    ) internal returns (uint256) {
        // generate poolKey directly from known token/WETH and detected hook (v4)
        IV4Quoter.PoolKey memory poolKey = IV4Quoter.PoolKey({
            currency0: token < WETH_BASE ? token : WETH_BASE,
            currency1: token < WETH_BASE ? WETH_BASE : token,
            fee: DYNAMIC_FEE_FLAG,
            tickSpacing: 200,
            hooks: hook
        });

        // Check for overflow when converting uint256 to uint128
        require(amount <= type(uint128).max, "Amount too large for uint128");
        
        IV4Quoter.QuoteExactSingleParams
            memory quoteExactSingleParams = IV4Quoter.QuoteExactSingleParams({
                poolKey: poolKey,
                zeroForOne: token < WETH_BASE,
                exactAmount: uint128(amount),
                hookData: '0x00'
            });

        IV4Quoter quoter = IV4Quoter(UNISWAP_V4_QUOTER_BASE);
        
        try quoter.quoteExactInputSingle(quoteExactSingleParams) returns (uint256 amountOut, uint256 /* gasEstimate */) {
            return amountOut;
        } catch Error(string memory reason) {
            emit QuoterError(reason);
            return 0;
        } catch (bytes memory lowLevelData) {
            emit QuoterLowLevelError(lowLevelData);
            return 0;
        }
    }

    function detectFactoryAndHook(address token)
        internal
        view
        returns (address factory, uint8 factoryVersion, address hook)
    {
        // Try v4 factory registry first; if it returns without revert, classify as v4
        IClanker clanker = IClanker(CLANKER_V4_0_0_BASE);
        try clanker.tokenDeploymentInfo(token) returns (IClanker.DeploymentInfo memory info) {
            // A valid v4 deployment will have a non-zero hook
            if (info.hook != address(0)) {
                return (CLANKER_V4_0_0_BASE, 4, info.hook);
            }
        } catch {
            // fall through to v3.1
        }
        return (CLANKER_V3_1_FACTORY_BASE, 3, address(0));
    }

    function addressSort(
        address a,
        address b
    ) internal pure returns (address, address, bool aIsFirst) {
        if (uint160(a) < uint160(b)) return (a, b, true);
        return (b, a, false);
    }


    /// Check if the tokenContext contains "streamm deployment" in the messageId field
    /// This is a simple string search since Solidity doesn't have JSON parsing
    function containsStreammDeployment(
        string memory tokenContext
    ) internal pure returns (bool) {
        bytes memory contextBytes = bytes(tokenContext);
        bytes memory searchPattern = bytes("streamm deployment");

        if (contextBytes.length < searchPattern.length) {
            return false;
        }

        // Simple substring search for "streamm deployment"
        for (uint i = 0; i <= contextBytes.length - searchPattern.length; i++) {
            bool found = true;
            for (uint j = 0; j < searchPattern.length; j++) {
                if (contextBytes[i + j] != searchPattern[j]) {
                    found = false;
                    break;
                }
            }
            if (found) {
                return true;
            }
        }

        return false;
    }
}
