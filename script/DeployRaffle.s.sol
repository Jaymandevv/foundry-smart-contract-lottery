// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "src/Raffle.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() public {}

    function deployContract() external returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();

        // local -> deploy mock, get local config
        // sepolia -> get sepolia config
        helperConfig.NetworkConfig memory config = helperConfig.getConfig();
        vm.startBroadcast();
        Raffle raffle = new Raffle(
            config.entranceFee, 
            config.interval, 
            config.vrfCoordinator, 
            config.gasLane, 
            config.subscriptionId, 
            config.callbackGasLimit
            )

        vm.stopBroadcast();


        return (raffle, helperConfig)
    }
}
