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
