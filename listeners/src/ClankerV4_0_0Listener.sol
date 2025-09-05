// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-generated/Generated.sol";

/// Index TokenCreated events from the ClankerV4_0_0 contract on Ethereum
/// To hook on more events, specify that this listener should implement that interface and follow the compiler errors.
contract ClankerV4_0_0Listener is ClankerV4_0_0$OnTokenCreatedEvent {
    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.

    struct TokenCreatedV4_0_0Data {
        address msgSender;
        address tokenAddress;
        address tokenAdmin;
        string tokenImage;
        string tokenName;
        string tokenSymbol;
        string tokenMetadata;
        string tokenContext;
        int24 startingTick;
        address poolHook;
        bytes32 poolId;
        address pairedToken;
        address locker;
        address mevModule;
        uint256 extensionsSupply;
        bytes32 txHash;
    }

    event TokenCreatedV4_0_0(TokenCreatedV4_0_0Data);

    /// The handler called whenever the ClankerV4_0_0 TokenCreated event is emitted.
    /// Within here you write your indexing specific logic (e.g., call out to other contracts to get more information).
    /// The only requirement for handlers is that they have the correct signature, but usually you will use generated interfaces to help write them.
    function onTokenCreatedEvent(
        EventContext memory ctx,
        ClankerV4_0_0$TokenCreatedEventParams memory inputs
    ) external override {
        TokenCreatedV4_0_0Data memory data = TokenCreatedV4_0_0Data({
            msgSender: inputs.msgSender,
            tokenAddress: inputs.tokenAddress,
            tokenAdmin: inputs.tokenAdmin,
            tokenImage: inputs.tokenImage,
            tokenName: inputs.tokenName,
            tokenSymbol: inputs.tokenSymbol,
            tokenMetadata: inputs.tokenMetadata,
            tokenContext: inputs.tokenContext,
            startingTick: inputs.startingTick,
            poolHook: inputs.poolHook,
            poolId: inputs.poolId,
            pairedToken: inputs.pairedToken,
            locker: inputs.locker,
            mevModule: inputs.mevModule,
            extensionsSupply: inputs.extensionsSupply,
            txHash: ctx.txn.hash()
        });

        emit TokenCreatedV4_0_0(data);
    }
}
