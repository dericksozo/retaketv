// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "sim-idx-generated/Generated.sol";
import "./interfaces/IClankerTokenV4_0.sol";
import "./interfaces/IClankerV4_0.sol";
import "./interfaces/IV4Quoter.sol";

/// Index Transfer events from the ClankerTokenV4_0 contract
/// This listener captures all token transfer events for tracking and analysis
contract ClankerTokenV4_0Listener is ClankerTokenV4_0$OnTransferEvent {
    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.

    address constant CLANKER_V4_0_0_BASE =
        0xE85A59c628F7d27878ACeB4bf3b35733630083a9;
    address constant UNISWAP_V4_POOLMANAGER_BASE =
        0x498581fF718922c3f8e6A244956aF099B2652b2b;
    address constant WETH_BASE = 0x4200000000000000000000000000000000000006;
    address constant UNISWAP_V4_QUOTER_BASE =
        0x0d5e0F971ED27FBfF6c2837bf31316121532048D;

    // from https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/libraries/LPFeeLibrary.sol#L15
    uint24 public constant DYNAMIC_FEE_FLAG = 0x800000;

    struct TransferData {
        address from;
        address to;
        address token;
        uint256 value;
        uint256 valueInEth;
        bytes32 txHash;
        string tokenContext;
        uint256 blockNumber;
    }

    // from https://github.com/Uniswap/v4-core/src/types/PoolKey.sol
    struct PoolKey {
        address currency0;
        address currency1;
        uint24 fee;
        int24 tickSpacing;
        address hooks;
    }

    event TransferV4_0_0(TransferData);

    // event TokenDeployment(
    //     address token,
    //     bytes32 txHash,
    //     IClanker.DeploymentInfo deploymentInfo
    // );
    // event PoolKeyEmitted(IV4Quoter.PoolKey poolKey, bytes32 poolId);
    // event QuoteExactSingleParamsEmitted(
    //     IV4Quoter.QuoteExactSingleParams quoteExactSingleParams
    // );
    // event AmountOutEmitted(uint256 amountOut);
    // event SortedAddresses(address c0, address c1, bool aIsFirst);
    // event QuoterError(string reason);
    // event QuoterLowLevelError(bytes data);

    /// @notice Error thrown when the token is not a retaketv token
    /// @dev Its selector is 0xa3729561.
    error NotARetaketvToken();

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

        // get value in eth
        uint256 valueInEth = getValue(
            ctx.txn.call.callee(),
            ctx.txn.hash(),
            inputs.value
        );

        TransferData memory data = TransferData({
            from: inputs.from,
            to: inputs.to,
            token: ctx.txn.call.callee(),
            value: inputs.value,
            valueInEth: valueInEth,
            txHash: ctx.txn.hash(),
            tokenContext: tokenContext,
            blockNumber: block.number
        });

        emit TransferV4_0_0(data);
    }

    function getValue(
        address token,
        bytes32 txHash,
        uint256 amount
    ) internal returns (uint256) {
        IClanker clanker = IClanker(CLANKER_V4_0_0_BASE);

        IClanker.DeploymentInfo memory deploymentInfo = clanker
            .tokenDeploymentInfo(token);

        // emit TokenDeployment(token, txHash, deploymentInfo);

        (address c0, address c1, bool aIsFirst) = addressSort(token, WETH_BASE);
        // emit SortedAddresses(c0, c1, aIsFirst);

        // generate poolId
        IV4Quoter.PoolKey memory poolKey = IV4Quoter.PoolKey({
            currency0: token < WETH_BASE ? token : WETH_BASE,
            currency1: token < WETH_BASE ? WETH_BASE : token,
            fee: DYNAMIC_FEE_FLAG,
            tickSpacing: 200,
            hooks: deploymentInfo.hook
        });
        // Generate the poolId as the keccak256 hash of the encoded poolKey
        bytes32 poolId = keccak256(abi.encode(poolKey));
        // bytes32 poolKeyHash = keccak256(abi.encode(poolKey));

        // emit PoolKeyEmitted(poolKey, poolId);

        // Check for overflow when converting uint256 to uint128
        require(amount <= type(uint128).max, "Amount too large for uint128");
        
        IV4Quoter.QuoteExactSingleParams
            memory quoteExactSingleParams = IV4Quoter.QuoteExactSingleParams({
                poolKey: poolKey,
                zeroForOne: token < WETH_BASE,
                exactAmount: uint128(amount),
                hookData: '0x00'
            });

        // emit QuoteExactSingleParamsEmitted(quoteExactSingleParams);


        IV4Quoter quoter = IV4Quoter(UNISWAP_V4_QUOTER_BASE);
        
        try quoter.quoteExactInputSingle(quoteExactSingleParams) returns (uint256 amountOut, uint256 gasEstimate) {
            // emit AmountOutEmitted(amountOut);
            return amountOut;
        } catch Error(string memory reason) {
            // Handle string errors (e.g., "Pool not found", "Insufficient liquidity")
            // emit QuoterError(reason);
            // emit AmountOutEmitted(0);
            return 0;
        } catch (bytes memory lowLevelData) {
            // Handle low-level errors (e.g., function not found, revert without reason)
            // emit QuoterLowLevelError(lowLevelData);
            // emit AmountOutEmitted(0);
            return 0;
        }
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
