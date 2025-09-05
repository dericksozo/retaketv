// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-generated/Generated.sol";
import "./interfaces/IClankerTokenV4_0.sol";

/// Index Transfer events from the ClankerTokenV4_0 contract
/// This listener captures all token transfer events for tracking and analysis
contract ClankerTokenV4_0Listener is ClankerTokenV4_0$OnTransferEvent {
    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.

    struct TransferData {
        address from;
        address to;
        uint256 value;
        bytes32 txHash;
        string tokenContext;
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
        string memory tokenContext = IClankerTokenV4_0(ctx.txn.call.callee()).context();

        // Only emit event if tokenContext contains "streamm deployment" in messageId
        if (containsStreammDeployment(tokenContext)) {
            TransferData memory data = TransferData({
                from: inputs.from,
                to: inputs.to,
                value: inputs.value,
                txHash: ctx.txn.hash(),
                tokenContext: tokenContext
            });

            emit TransferV4_0_0(data);
        }
    }

    /// Check if the tokenContext contains "streamm deployment" in the messageId field
    /// This is a simple string search since Solidity doesn't have JSON parsing
    function containsStreammDeployment(string memory tokenContext) internal pure returns (bool) {
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
