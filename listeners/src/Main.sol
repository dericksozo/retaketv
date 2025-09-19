// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";

// import "./ClankerV4_0_0Listener.sol";
import "./ClankerTokenV4_0Listener.sol";

contract Triggers is BaseTriggers {
    // Clanker contract addresses on BASE
    address constant CLANKER_V1_0_0_BASE = 0x9B84fcE5Dcd9a38d2D01d5D72373F6b6b067c3e1;
    address constant CLANKER_V2_0_0_BASE = 0x732560fa1d1A76350b1A500155BA978031B53833;
    address constant CLANKER_V3_0_0_BASE = 0x375C15db32D28cEcdcAB5C03Ab889bf15cbD2c5E;
    address constant CLANKER_V3_1_0_BASE = 0x2A787b2362021cC3eEa3C24C4748a6cD5B687382;
    address constant CLANKER_V4_0_0_BASE = 0xE85A59c628F7d27878ACeB4bf3b35733630083a9;

    uint256 constant START_BLOCK = 35660000;
    uint256 constant END_BLOCK = START_BLOCK + 5000;

    function triggers() external virtual override {

        // // ClankerV4_0_0 on BASE
        // ClankerV4_0_0Listener clankerV4Listener = new ClankerV4_0_0Listener();
        // addTrigger(
        //     chainContract(Chains.Base, CLANKER_V4_0_0_BASE),
        //     clankerV4Listener.triggerOnTokenCreatedEvent()
        // );

        // ClankerTokenV4_0 Transfer events on BASE
        ClankerTokenV4_0Listener clankerTokenV4Listener = new ClankerTokenV4_0Listener();
        addTrigger(
            chainAbi(Chains.Base.withStartBlock(START_BLOCK).withEndBlock(END_BLOCK), ClankerTokenV4_0$Abi()),
            clankerTokenV4Listener.triggerOnTransferEvent()
        );
    }
}
