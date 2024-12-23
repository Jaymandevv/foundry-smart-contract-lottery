// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
 * @title Raffle Smart Contract
 * @author Garba Jamiu
 * @notice This contract is for creating a sample raffle
 * @dev Implement Chainlink VRFv2.5
 */

contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    // Enter the raffle by buying the lottery ticket
    // The amount they buy the ticket will be added to
    // a pool of money which the winner will collect at end.
    function enterRaffle() public payable {}

    function pickWinner() public {}

    /** Getter Functions */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
