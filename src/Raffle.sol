// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
 * @title Raffle Smart Contract
 * @author Garba Jamiu
 * @notice This contract is for creating a sample raffle
 * @dev Implement Chainlink VRFv2.5
 */

contract Raffle {
    /** Errors */
    error Raffle__SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;
    // @dev The duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /** Events */

    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    // Enter the raffle by buying the lottery ticket
    // The amount they buy the ticket will be added to
    // a pool of money which the winner will collect at end.
    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough eth sent!"); - Legacy
        // require(msg.value >= i_entranceFee, Raffle__SendMoreToEnterRaffle()); - This only work on some specific versions.

        if (msg.value < i_entranceFee) revert Raffle__SendMoreToEnterRaffle();
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    //TODO:
    // 1. Get a random number
    // 2. Use the random number to pick a player
    // 3. Authomatically call the pickWinner function

    function pickWinner() external {
        // Check to see if enough time has passed
        if ((block.timestamp - s_lastTimeStamp) < i_interval) revert();
    }

    /** Getter Functions */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
