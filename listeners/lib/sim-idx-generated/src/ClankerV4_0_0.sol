// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-sol/src/Triggers.sol";
import "lib/sim-idx-sol/src/Context.sol";

function ClankerV4_0_0$Abi() pure returns (Abi memory) {
    return Abi("ClankerV4_0_0");
}
struct ClankerV4_0_0$BpsFunctionOutputs {
    uint256 outArg0;
}

struct ClankerV4_0_0$MaxExtensionsFunctionOutputs {
    uint256 outArg0;
}

struct ClankerV4_0_0$MaxExtensionBpsFunctionOutputs {
    uint16 outArg0;
}

struct ClankerV4_0_0$TokenSupplyFunctionOutputs {
    uint256 outArg0;
}

struct ClankerV4_0_0$AdminsFunctionInputs {
    address outArg0;
}

struct ClankerV4_0_0$AdminsFunctionOutputs {
    bool outArg0;
}

struct ClankerV4_0_0$ClaimTeamFeesFunctionInputs {
    address token;
}

struct ClankerV4_0_0$IClanker$TokenConfig {
    address tokenAdmin;
    string name;
    string symbol;
    bytes32 salt;
    string image;
    string metadata;
    string context;
    uint256 originatingChainId;
}

struct ClankerV4_0_0$IClanker$PoolConfig {
    address hook;
    address pairedToken;
    int24 tickIfToken0IsClanker;
    int24 tickSpacing;
    bytes poolData;
}

struct ClankerV4_0_0$IClanker$LockerConfig {
    address locker;
    address[] rewardAdmins;
    address[] rewardRecipients;
    uint16[] rewardBps;
    int24[] tickLower;
    int24[] tickUpper;
    uint16[] positionBps;
    bytes lockerData;
}

struct ClankerV4_0_0$IClanker$MevModuleConfig {
    address mevModule;
    bytes mevModuleData;
}

struct ClankerV4_0_0$IClanker$ExtensionConfig {
    address extension;
    uint256 msgValue;
    uint16 extensionBps;
    bytes extensionData;
}

struct ClankerV4_0_0$IClanker$DeploymentConfig {
    ClankerV4_0_0$IClanker$TokenConfig tokenConfig;
    ClankerV4_0_0$IClanker$PoolConfig poolConfig;
    ClankerV4_0_0$IClanker$LockerConfig lockerConfig;
    ClankerV4_0_0$IClanker$MevModuleConfig mevModuleConfig;
    ClankerV4_0_0$IClanker$ExtensionConfig[] extensionConfigs;
}

struct ClankerV4_0_0$DeployTokenFunctionInputs {
    ClankerV4_0_0$IClanker$DeploymentConfig deploymentConfig;
}

struct ClankerV4_0_0$DeployTokenFunctionOutputs {
    address tokenAddress;
}

struct ClankerV4_0_0$DeployTokenZeroSupplyFunctionInputs {
    ClankerV4_0_0$IClanker$TokenConfig tokenConfig;
}

struct ClankerV4_0_0$DeployTokenZeroSupplyFunctionOutputs {
    address tokenAddress;
}

struct ClankerV4_0_0$DeploymentInfoForTokenFunctionInputs {
    address token;
}

struct ClankerV4_0_0$DeploymentInfoForTokenFunctionOutputs {
    address token;
    address hook;
    address locker;
}

struct ClankerV4_0_0$DeprecatedFunctionOutputs {
    bool outArg0;
}

struct ClankerV4_0_0$EnabledLockersFunctionInputs {
    address locker;
    address hook;
}

struct ClankerV4_0_0$EnabledLockersFunctionOutputs {
    bool enabled;
}

struct ClankerV4_0_0$OwnerFunctionOutputs {
    address outArg0;
}

struct ClankerV4_0_0$SetAdminFunctionInputs {
    address admin;
    bool enabled;
}

struct ClankerV4_0_0$SetDeprecatedFunctionInputs {
    bool deprecated_;
}

struct ClankerV4_0_0$SetExtensionFunctionInputs {
    address extension;
    bool enabled;
}

struct ClankerV4_0_0$SetHookFunctionInputs {
    address hook;
    bool enabled;
}

struct ClankerV4_0_0$SetLockerFunctionInputs {
    address locker;
    address hook;
    bool enabled;
}

struct ClankerV4_0_0$SetMevModuleFunctionInputs {
    address mevModule;
    bool enabled;
}

struct ClankerV4_0_0$SetTeamFeeRecipientFunctionInputs {
    address teamFeeRecipient_;
}

struct ClankerV4_0_0$TeamFeeRecipientFunctionOutputs {
    address outArg0;
}

struct ClankerV4_0_0$TokenDeploymentInfoFunctionInputs {
    address token;
}

struct ClankerV4_0_0$IClanker$DeploymentInfo {
    address token;
    address hook;
    address locker;
    address[] extensions;
}

struct ClankerV4_0_0$TokenDeploymentInfoFunctionOutputs {
    ClankerV4_0_0$IClanker$DeploymentInfo outArg0;
}

struct ClankerV4_0_0$TransferOwnershipFunctionInputs {
    address newOwner;
}

struct ClankerV4_0_0$ClaimTeamFeesEventParams {
    address token;
    address recipient;
    uint256 amount;
}

struct ClankerV4_0_0$ExtensionTriggeredEventParams {
    address extension;
    uint256 extensionSupply;
    uint256 msgValue;
}

struct ClankerV4_0_0$OwnershipTransferredEventParams {
    address previousOwner;
    address newOwner;
}

struct ClankerV4_0_0$SetAdminEventParams {
    address admin;
    bool enabled;
}

struct ClankerV4_0_0$SetDeprecatedEventParams {
    bool deprecated;
}

struct ClankerV4_0_0$SetExtensionEventParams {
    address extension;
    bool enabled;
}

struct ClankerV4_0_0$SetHookEventParams {
    address hook;
    bool enabled;
}

struct ClankerV4_0_0$SetLockerEventParams {
    address locker;
    address hook;
    bool enabled;
}

struct ClankerV4_0_0$SetMevModuleEventParams {
    address mevModule;
    bool enabled;
}

struct ClankerV4_0_0$SetTeamFeeRecipientEventParams {
    address oldTeamFeeRecipient;
    address newTeamFeeRecipient;
}

struct ClankerV4_0_0$TokenCreatedEventParams {
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
    address[] extensions;
}

abstract contract ClankerV4_0_0$OnClaimTeamFeesEvent {
    function onClaimTeamFeesEvent(EventContext memory ctx, ClankerV4_0_0$ClaimTeamFeesEventParams memory inputs) virtual external;

    function triggerOnClaimTeamFeesEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0xe5b9f4d1f6cf7c3238f0c0b48597a9ccd3ff3d2309f3ccd30bd46aad5e06a638),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onClaimTeamFeesEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnExtensionTriggeredEvent {
    function onExtensionTriggeredEvent(EventContext memory ctx, ClankerV4_0_0$ExtensionTriggeredEventParams memory inputs) virtual external;

    function triggerOnExtensionTriggeredEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0xe80ed94c33183ba307727bf230f18d40178975f51b301a8415b90f4c9f549b7f),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onExtensionTriggeredEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnOwnershipTransferredEvent {
    function onOwnershipTransferredEvent(EventContext memory ctx, ClankerV4_0_0$OwnershipTransferredEventParams memory inputs) virtual external;

    function triggerOnOwnershipTransferredEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOwnershipTransferredEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetAdminEvent {
    function onSetAdminEvent(EventContext memory ctx, ClankerV4_0_0$SetAdminEventParams memory inputs) virtual external;

    function triggerOnSetAdminEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0x55a5194bc0174fcaf12b2978bef43911466bf63b34db8d1dd1a0d5dcd5c41bea),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetAdminEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetDeprecatedEvent {
    function onSetDeprecatedEvent(EventContext memory ctx, ClankerV4_0_0$SetDeprecatedEventParams memory inputs) virtual external;

    function triggerOnSetDeprecatedEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0x20db9067ad1976f7d6ee4ee07eea48c1139e0716fd856ec6edf203236c37db82),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetDeprecatedEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetExtensionEvent {
    function onSetExtensionEvent(EventContext memory ctx, ClankerV4_0_0$SetExtensionEventParams memory inputs) virtual external;

    function triggerOnSetExtensionEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0xb393434b606480a39b9a3b6f498a7f5312283d75b93f92d1dffc0dae86425ea2),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetExtensionEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetHookEvent {
    function onSetHookEvent(EventContext memory ctx, ClankerV4_0_0$SetHookEventParams memory inputs) virtual external;

    function triggerOnSetHookEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0x3e7510e93c4fe81ab57ed70b4eaa9a407eeced9cdb0954a360b36947f38ccda0),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetHookEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetLockerEvent {
    function onSetLockerEvent(EventContext memory ctx, ClankerV4_0_0$SetLockerEventParams memory inputs) virtual external;

    function triggerOnSetLockerEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0xa42b595aa29ec637074f31538fbf673587d74ba490265a33cf04ed41d27a9ddc),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetLockerEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetMevModuleEvent {
    function onSetMevModuleEvent(EventContext memory ctx, ClankerV4_0_0$SetMevModuleEventParams memory inputs) virtual external;

    function triggerOnSetMevModuleEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0xc4bf3ad397ab835bf8aefef70e7e1c35a0cfad7be9c060049050303ace20605c),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetMevModuleEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetTeamFeeRecipientEvent {
    function onSetTeamFeeRecipientEvent(EventContext memory ctx, ClankerV4_0_0$SetTeamFeeRecipientEventParams memory inputs) virtual external;

    function triggerOnSetTeamFeeRecipientEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0xb4a70636e7a4c9d224bbe13304010ccb0ac964b3cc46c612d9abaeacfa204bd9),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetTeamFeeRecipientEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnTokenCreatedEvent {
    function onTokenCreatedEvent(EventContext memory ctx, ClankerV4_0_0$TokenCreatedEventParams memory inputs) virtual external;

    function triggerOnTokenCreatedEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes32(0x9299d1d1a88d8e1abdc591ae7a167a6bc63a8f17d695804e9091ee33aa89fb67),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenCreatedEvent.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnBpsFunction {
    function onBpsFunction(FunctionContext memory ctx, ClankerV4_0_0$BpsFunctionOutputs memory outputs) virtual external;

    function triggerOnBpsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x249d39e9),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBpsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreBpsFunction {
    function preBpsFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreBpsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x249d39e9),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBpsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnMaxExtensionsFunction {
    function onMaxExtensionsFunction(FunctionContext memory ctx, ClankerV4_0_0$MaxExtensionsFunctionOutputs memory outputs) virtual external;

    function triggerOnMaxExtensionsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xc07780f6),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onMaxExtensionsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreMaxExtensionsFunction {
    function preMaxExtensionsFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreMaxExtensionsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xc07780f6),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preMaxExtensionsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnMaxExtensionBpsFunction {
    function onMaxExtensionBpsFunction(FunctionContext memory ctx, ClankerV4_0_0$MaxExtensionBpsFunctionOutputs memory outputs) virtual external;

    function triggerOnMaxExtensionBpsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xcca91a70),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onMaxExtensionBpsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreMaxExtensionBpsFunction {
    function preMaxExtensionBpsFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreMaxExtensionBpsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xcca91a70),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preMaxExtensionBpsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnTokenSupplyFunction {
    function onTokenSupplyFunction(FunctionContext memory ctx, ClankerV4_0_0$TokenSupplyFunctionOutputs memory outputs) virtual external;

    function triggerOnTokenSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xb152f6cf),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenSupplyFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreTokenSupplyFunction {
    function preTokenSupplyFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreTokenSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xb152f6cf),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokenSupplyFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnAdminsFunction {
    function onAdminsFunction(FunctionContext memory ctx, ClankerV4_0_0$AdminsFunctionInputs memory inputs, ClankerV4_0_0$AdminsFunctionOutputs memory outputs) virtual external;

    function triggerOnAdminsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x429b62e5),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAdminsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreAdminsFunction {
    function preAdminsFunction(PreFunctionContext memory ctx, ClankerV4_0_0$AdminsFunctionInputs memory inputs) virtual external;

    function triggerPreAdminsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x429b62e5),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAdminsFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnClaimTeamFeesFunction {
    function onClaimTeamFeesFunction(FunctionContext memory ctx, ClankerV4_0_0$ClaimTeamFeesFunctionInputs memory inputs) virtual external;

    function triggerOnClaimTeamFeesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x0f0f3a2f),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onClaimTeamFeesFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreClaimTeamFeesFunction {
    function preClaimTeamFeesFunction(PreFunctionContext memory ctx, ClankerV4_0_0$ClaimTeamFeesFunctionInputs memory inputs) virtual external;

    function triggerPreClaimTeamFeesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x0f0f3a2f),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preClaimTeamFeesFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnDeployTokenFunction {
    function onDeployTokenFunction(FunctionContext memory ctx, ClankerV4_0_0$DeployTokenFunctionInputs memory inputs, ClankerV4_0_0$DeployTokenFunctionOutputs memory outputs) virtual external;

    function triggerOnDeployTokenFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xdf40224a),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDeployTokenFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreDeployTokenFunction {
    function preDeployTokenFunction(PreFunctionContext memory ctx, ClankerV4_0_0$DeployTokenFunctionInputs memory inputs) virtual external;

    function triggerPreDeployTokenFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xdf40224a),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDeployTokenFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnDeployTokenZeroSupplyFunction {
    function onDeployTokenZeroSupplyFunction(FunctionContext memory ctx, ClankerV4_0_0$DeployTokenZeroSupplyFunctionInputs memory inputs, ClankerV4_0_0$DeployTokenZeroSupplyFunctionOutputs memory outputs) virtual external;

    function triggerOnDeployTokenZeroSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xa238f07f),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDeployTokenZeroSupplyFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreDeployTokenZeroSupplyFunction {
    function preDeployTokenZeroSupplyFunction(PreFunctionContext memory ctx, ClankerV4_0_0$DeployTokenZeroSupplyFunctionInputs memory inputs) virtual external;

    function triggerPreDeployTokenZeroSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xa238f07f),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDeployTokenZeroSupplyFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnDeploymentInfoForTokenFunction {
    function onDeploymentInfoForTokenFunction(FunctionContext memory ctx, ClankerV4_0_0$DeploymentInfoForTokenFunctionInputs memory inputs, ClankerV4_0_0$DeploymentInfoForTokenFunctionOutputs memory outputs) virtual external;

    function triggerOnDeploymentInfoForTokenFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x06562980),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDeploymentInfoForTokenFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreDeploymentInfoForTokenFunction {
    function preDeploymentInfoForTokenFunction(PreFunctionContext memory ctx, ClankerV4_0_0$DeploymentInfoForTokenFunctionInputs memory inputs) virtual external;

    function triggerPreDeploymentInfoForTokenFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x06562980),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDeploymentInfoForTokenFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnDeprecatedFunction {
    function onDeprecatedFunction(FunctionContext memory ctx, ClankerV4_0_0$DeprecatedFunctionOutputs memory outputs) virtual external;

    function triggerOnDeprecatedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x0e136b19),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDeprecatedFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreDeprecatedFunction {
    function preDeprecatedFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreDeprecatedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x0e136b19),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDeprecatedFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnEnabledLockersFunction {
    function onEnabledLockersFunction(FunctionContext memory ctx, ClankerV4_0_0$EnabledLockersFunctionInputs memory inputs, ClankerV4_0_0$EnabledLockersFunctionOutputs memory outputs) virtual external;

    function triggerOnEnabledLockersFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x3c909e39),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onEnabledLockersFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreEnabledLockersFunction {
    function preEnabledLockersFunction(PreFunctionContext memory ctx, ClankerV4_0_0$EnabledLockersFunctionInputs memory inputs) virtual external;

    function triggerPreEnabledLockersFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x3c909e39),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preEnabledLockersFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnOwnerFunction {
    function onOwnerFunction(FunctionContext memory ctx, ClankerV4_0_0$OwnerFunctionOutputs memory outputs) virtual external;

    function triggerOnOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x8da5cb5b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOwnerFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreOwnerFunction {
    function preOwnerFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x8da5cb5b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preOwnerFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnRenounceOwnershipFunction {
    function onRenounceOwnershipFunction(FunctionContext memory ctx) virtual external;

    function triggerOnRenounceOwnershipFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x715018a6),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onRenounceOwnershipFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreRenounceOwnershipFunction {
    function preRenounceOwnershipFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreRenounceOwnershipFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x715018a6),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preRenounceOwnershipFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetAdminFunction {
    function onSetAdminFunction(FunctionContext memory ctx, ClankerV4_0_0$SetAdminFunctionInputs memory inputs) virtual external;

    function triggerOnSetAdminFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x4b0bddd2),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetAdminFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetAdminFunction {
    function preSetAdminFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetAdminFunctionInputs memory inputs) virtual external;

    function triggerPreSetAdminFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x4b0bddd2),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetAdminFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetDeprecatedFunction {
    function onSetDeprecatedFunction(FunctionContext memory ctx, ClankerV4_0_0$SetDeprecatedFunctionInputs memory inputs) virtual external;

    function triggerOnSetDeprecatedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xd848dee7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetDeprecatedFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetDeprecatedFunction {
    function preSetDeprecatedFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetDeprecatedFunctionInputs memory inputs) virtual external;

    function triggerPreSetDeprecatedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xd848dee7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetDeprecatedFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetExtensionFunction {
    function onSetExtensionFunction(FunctionContext memory ctx, ClankerV4_0_0$SetExtensionFunctionInputs memory inputs) virtual external;

    function triggerOnSetExtensionFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x031bc1ba),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetExtensionFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetExtensionFunction {
    function preSetExtensionFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetExtensionFunctionInputs memory inputs) virtual external;

    function triggerPreSetExtensionFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x031bc1ba),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetExtensionFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetHookFunction {
    function onSetHookFunction(FunctionContext memory ctx, ClankerV4_0_0$SetHookFunctionInputs memory inputs) virtual external;

    function triggerOnSetHookFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x833e8db1),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetHookFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetHookFunction {
    function preSetHookFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetHookFunctionInputs memory inputs) virtual external;

    function triggerPreSetHookFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x833e8db1),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetHookFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetLockerFunction {
    function onSetLockerFunction(FunctionContext memory ctx, ClankerV4_0_0$SetLockerFunctionInputs memory inputs) virtual external;

    function triggerOnSetLockerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xfc1b6022),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetLockerFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetLockerFunction {
    function preSetLockerFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetLockerFunctionInputs memory inputs) virtual external;

    function triggerPreSetLockerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xfc1b6022),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetLockerFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetMevModuleFunction {
    function onSetMevModuleFunction(FunctionContext memory ctx, ClankerV4_0_0$SetMevModuleFunctionInputs memory inputs) virtual external;

    function triggerOnSetMevModuleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xdbb0b1c7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetMevModuleFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetMevModuleFunction {
    function preSetMevModuleFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetMevModuleFunctionInputs memory inputs) virtual external;

    function triggerPreSetMevModuleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xdbb0b1c7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetMevModuleFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnSetTeamFeeRecipientFunction {
    function onSetTeamFeeRecipientFunction(FunctionContext memory ctx, ClankerV4_0_0$SetTeamFeeRecipientFunctionInputs memory inputs) virtual external;

    function triggerOnSetTeamFeeRecipientFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x926ff255),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetTeamFeeRecipientFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreSetTeamFeeRecipientFunction {
    function preSetTeamFeeRecipientFunction(PreFunctionContext memory ctx, ClankerV4_0_0$SetTeamFeeRecipientFunctionInputs memory inputs) virtual external;

    function triggerPreSetTeamFeeRecipientFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x926ff255),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetTeamFeeRecipientFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnTeamFeeRecipientFunction {
    function onTeamFeeRecipientFunction(FunctionContext memory ctx, ClankerV4_0_0$TeamFeeRecipientFunctionOutputs memory outputs) virtual external;

    function triggerOnTeamFeeRecipientFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x228871c5),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTeamFeeRecipientFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreTeamFeeRecipientFunction {
    function preTeamFeeRecipientFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreTeamFeeRecipientFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x228871c5),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTeamFeeRecipientFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnTokenDeploymentInfoFunction {
    function onTokenDeploymentInfoFunction(FunctionContext memory ctx, ClankerV4_0_0$TokenDeploymentInfoFunctionInputs memory inputs, ClankerV4_0_0$TokenDeploymentInfoFunctionOutputs memory outputs) virtual external;

    function triggerOnTokenDeploymentInfoFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x22adcdb1),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenDeploymentInfoFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreTokenDeploymentInfoFunction {
    function preTokenDeploymentInfoFunction(PreFunctionContext memory ctx, ClankerV4_0_0$TokenDeploymentInfoFunctionInputs memory inputs) virtual external;

    function triggerPreTokenDeploymentInfoFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0x22adcdb1),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokenDeploymentInfoFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$OnTransferOwnershipFunction {
    function onTransferOwnershipFunction(FunctionContext memory ctx, ClankerV4_0_0$TransferOwnershipFunctionInputs memory inputs) virtual external;

    function triggerOnTransferOwnershipFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xf2fde38b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferOwnershipFunction.selector
        });
    }
}

abstract contract ClankerV4_0_0$PreTransferOwnershipFunction {
    function preTransferOwnershipFunction(PreFunctionContext memory ctx, ClankerV4_0_0$TransferOwnershipFunctionInputs memory inputs) virtual external;

    function triggerPreTransferOwnershipFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "ClankerV4_0_0",
            selector: bytes4(0xf2fde38b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferOwnershipFunction.selector
        });
    }
}


struct ClankerV4_0_0$EmitAllEvents$ClaimTeamFees {
  address token;
  address recipient;
  uint256 amount;
}

struct ClankerV4_0_0$EmitAllEvents$ExtensionTriggered {
  address extension;
  uint256 extensionSupply;
  uint256 msgValue;
}

struct ClankerV4_0_0$EmitAllEvents$OwnershipTransferred {
  address previousOwner;
  address newOwner;
}

struct ClankerV4_0_0$EmitAllEvents$SetAdmin {
  address admin;
  bool enabled;
}

struct ClankerV4_0_0$EmitAllEvents$SetDeprecated {
  bool deprecated;
}

struct ClankerV4_0_0$EmitAllEvents$SetExtension {
  address extension;
  bool enabled;
}

struct ClankerV4_0_0$EmitAllEvents$SetHook {
  address hook;
  bool enabled;
}

struct ClankerV4_0_0$EmitAllEvents$SetLocker {
  address locker;
  address hook;
  bool enabled;
}

struct ClankerV4_0_0$EmitAllEvents$SetMevModule {
  address mevModule;
  bool enabled;
}

struct ClankerV4_0_0$EmitAllEvents$SetTeamFeeRecipient {
  address oldTeamFeeRecipient;
  address newTeamFeeRecipient;
}

struct ClankerV4_0_0$EmitAllEvents$TokenCreated {
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
  address[] extensions;
}

contract ClankerV4_0_0$EmitAllEvents is
  ClankerV4_0_0$OnClaimTeamFeesEvent,
ClankerV4_0_0$OnExtensionTriggeredEvent,
ClankerV4_0_0$OnOwnershipTransferredEvent,
ClankerV4_0_0$OnSetAdminEvent,
ClankerV4_0_0$OnSetDeprecatedEvent,
ClankerV4_0_0$OnSetExtensionEvent,
ClankerV4_0_0$OnSetHookEvent,
ClankerV4_0_0$OnSetLockerEvent,
ClankerV4_0_0$OnSetMevModuleEvent,
ClankerV4_0_0$OnSetTeamFeeRecipientEvent,
ClankerV4_0_0$OnTokenCreatedEvent
{
  event ClaimTeamFees(ClankerV4_0_0$EmitAllEvents$ClaimTeamFees);
  event ExtensionTriggered(ClankerV4_0_0$EmitAllEvents$ExtensionTriggered);
  event OwnershipTransferred(ClankerV4_0_0$EmitAllEvents$OwnershipTransferred);
  event SetAdmin(ClankerV4_0_0$EmitAllEvents$SetAdmin);
  event SetDeprecated(ClankerV4_0_0$EmitAllEvents$SetDeprecated);
  event SetExtension(ClankerV4_0_0$EmitAllEvents$SetExtension);
  event SetHook(ClankerV4_0_0$EmitAllEvents$SetHook);
  event SetLocker(ClankerV4_0_0$EmitAllEvents$SetLocker);
  event SetMevModule(ClankerV4_0_0$EmitAllEvents$SetMevModule);
  event SetTeamFeeRecipient(ClankerV4_0_0$EmitAllEvents$SetTeamFeeRecipient);
  event TokenCreated(ClankerV4_0_0$EmitAllEvents$TokenCreated);

  function onClaimTeamFeesEvent(EventContext memory ctx, ClankerV4_0_0$ClaimTeamFeesEventParams memory inputs) virtual external override {
    emit ClaimTeamFees(ClankerV4_0_0$EmitAllEvents$ClaimTeamFees(inputs.token, inputs.recipient, inputs.amount));
  }
function onExtensionTriggeredEvent(EventContext memory ctx, ClankerV4_0_0$ExtensionTriggeredEventParams memory inputs) virtual external override {
    emit ExtensionTriggered(ClankerV4_0_0$EmitAllEvents$ExtensionTriggered(inputs.extension, inputs.extensionSupply, inputs.msgValue));
  }
function onOwnershipTransferredEvent(EventContext memory ctx, ClankerV4_0_0$OwnershipTransferredEventParams memory inputs) virtual external override {
    emit OwnershipTransferred(ClankerV4_0_0$EmitAllEvents$OwnershipTransferred(inputs.previousOwner, inputs.newOwner));
  }
function onSetAdminEvent(EventContext memory ctx, ClankerV4_0_0$SetAdminEventParams memory inputs) virtual external override {
    emit SetAdmin(ClankerV4_0_0$EmitAllEvents$SetAdmin(inputs.admin, inputs.enabled));
  }
function onSetDeprecatedEvent(EventContext memory ctx, ClankerV4_0_0$SetDeprecatedEventParams memory inputs) virtual external override {
    emit SetDeprecated(ClankerV4_0_0$EmitAllEvents$SetDeprecated(inputs.deprecated));
  }
function onSetExtensionEvent(EventContext memory ctx, ClankerV4_0_0$SetExtensionEventParams memory inputs) virtual external override {
    emit SetExtension(ClankerV4_0_0$EmitAllEvents$SetExtension(inputs.extension, inputs.enabled));
  }
function onSetHookEvent(EventContext memory ctx, ClankerV4_0_0$SetHookEventParams memory inputs) virtual external override {
    emit SetHook(ClankerV4_0_0$EmitAllEvents$SetHook(inputs.hook, inputs.enabled));
  }
function onSetLockerEvent(EventContext memory ctx, ClankerV4_0_0$SetLockerEventParams memory inputs) virtual external override {
    emit SetLocker(ClankerV4_0_0$EmitAllEvents$SetLocker(inputs.locker, inputs.hook, inputs.enabled));
  }
function onSetMevModuleEvent(EventContext memory ctx, ClankerV4_0_0$SetMevModuleEventParams memory inputs) virtual external override {
    emit SetMevModule(ClankerV4_0_0$EmitAllEvents$SetMevModule(inputs.mevModule, inputs.enabled));
  }
function onSetTeamFeeRecipientEvent(EventContext memory ctx, ClankerV4_0_0$SetTeamFeeRecipientEventParams memory inputs) virtual external override {
    emit SetTeamFeeRecipient(ClankerV4_0_0$EmitAllEvents$SetTeamFeeRecipient(inputs.oldTeamFeeRecipient, inputs.newTeamFeeRecipient));
  }
function onTokenCreatedEvent(EventContext memory ctx, ClankerV4_0_0$TokenCreatedEventParams memory inputs) virtual external override {
    emit TokenCreated(ClankerV4_0_0$EmitAllEvents$TokenCreated(inputs.msgSender, inputs.tokenAddress, inputs.tokenAdmin, inputs.tokenImage, inputs.tokenName, inputs.tokenSymbol, inputs.tokenMetadata, inputs.tokenContext, inputs.startingTick, inputs.poolHook, inputs.poolId, inputs.pairedToken, inputs.locker, inputs.mevModule, inputs.extensionsSupply, inputs.extensions));
  }

  function allTriggers() view external returns (Trigger[] memory) {
    Trigger[] memory triggers = new Trigger[](11);
    triggers[0] = this.triggerOnClaimTeamFeesEvent();
    triggers[1] = this.triggerOnExtensionTriggeredEvent();
    triggers[2] = this.triggerOnOwnershipTransferredEvent();
    triggers[3] = this.triggerOnSetAdminEvent();
    triggers[4] = this.triggerOnSetDeprecatedEvent();
    triggers[5] = this.triggerOnSetExtensionEvent();
    triggers[6] = this.triggerOnSetHookEvent();
    triggers[7] = this.triggerOnSetLockerEvent();
    triggers[8] = this.triggerOnSetMevModuleEvent();
    triggers[9] = this.triggerOnSetTeamFeeRecipientEvent();
    triggers[10] = this.triggerOnTokenCreatedEvent();
    return triggers;
  }
}