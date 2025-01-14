// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "script/Interaction.s.sol";
import {DeployRaffle} from "script/DeployRaffle.s.sol";
import {Raffle} from "src/Raffle.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract InteractionTest is Test {
    Raffle raffle;
    HelperConfig helperConfig;

    address PLAYER = makeAddr("PLAYER");
    uint256 constant AMOUNT = 10 ether;

    function setUp() external {
        DeployRaffle deployRaffle = new DeployRaffle();
        (raffle, helperConfig) = deployRaffle.deployContract();
        vm.deal(PLAYER, AMOUNT);
    }

    function testRaffleInteraction() public {
        CreateSubscription createSubscription = new CreateSubscription();
        (uint256 subId, address vrfCoordinator) = createSubscription
            .createSubscriptionUsingConfig();
        assert(subId > 0);

        // FundSubscription fundSubscription = new FundSubscription();
        // fundSubscription.fundsubscriptionUsingConfig();
        // assert(address(vrfCoordinator).balance > 0);
    }
}
