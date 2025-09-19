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

    address constant CLANKER_V4_0_0_BASE = 0xE85A59c628F7d27878ACeB4bf3b35733630083a9;
    address constant UNISWAP_V4_POOLMANAGER_BASE = 0x498581fF718922c3f8e6A244956aF099B2652b2b;
    address constant WETH_BASE = 0x4200000000000000000000000000000000000006;
    address constant UNISWAP_V4_QUOTER_BASE = 0x0d5e0F971ED27FBfF6c2837bf31316121532048D;

    struct TransferData {
        address from;
        address to;
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

    /// The handler called whenever the ClankerTokenV4_0 Transfer event is emitted.
    /// Within here you write your indexing specific logic (e.g., call out to other contracts to get more information).
    /// The only requirement for handlers is that they have the correct signature, but usually you will use generated interfaces to help write them.
    function onTransferEvent(
        EventContext memory ctx,
        ClankerTokenV4_0$TransferEventParams memory inputs
    ) external override {
        // get token context by calling the token context function
        string memory tokenContext = IClankerTokenV4_0(ctx.txn.call.callee())
            .context();

        if (!containsStreammDeployment(tokenContext)) {
            revert("Not a StreamDeployment");
        }

        // uint256 valueInEth = getValue(ctx.txn.call.callee(), inputs.value);

        TransferData memory data = TransferData({
            from: inputs.from,
            to: inputs.to,
            value: inputs.value,
            valueInEth: 0,
            txHash: ctx.txn.hash(),
            tokenContext: tokenContext,
            blockNumber: block.number
        });

        emit TransferV4_0_0(data);
    }

    function getValue(
        address token,
        uint256 amount
    ) internal view returns (uint256) {
        IClanker clanker = IClanker(CLANKER_V4_0_0_BASE);

        IClanker.DeploymentInfo memory deploymentInfo = clanker
            .tokenDeploymentInfo(token);

        // generate poolId
        IV4Quoter.PoolKey memory poolKey = IV4Quoter.PoolKey({
            currency0: token < WETH_BASE ? token : WETH_BASE,
            currency1: token < WETH_BASE ? WETH_BASE : token,
            fee: 8388608,
            tickSpacing: 200,
            hooks: deploymentInfo.hook
        });
        // bytes32 poolKeyHash = keccak256(abi.encode(poolKey));

        IV4Quoter quoter = IV4Quoter(UNISWAP_V4_QUOTER_BASE);
        IV4Quoter.QuoteExactSingleParams memory quoteExactSingleParams = IV4Quoter.QuoteExactSingleParams({
            poolKey: poolKey,
            zeroForOne: token < WETH_BASE,
            exactAmount: uint128(amount),
            hookData: ""
        });
        (uint256 amountOut, uint256 gasEstimate) = quoter.quoteExactInputSingle(quoteExactSingleParams);

        return amountOut;
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
