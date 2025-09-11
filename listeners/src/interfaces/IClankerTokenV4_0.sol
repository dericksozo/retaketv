// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;


/// @title IClankerTokenV4_0
/// @notice Interface for the `context()` view method on ClankerTokenV4_0
interface IClankerTokenV4_0 {
    /// @notice Returns the context string for this token
    /// @return context The context string
    function context() external view returns (string memory context);
}
