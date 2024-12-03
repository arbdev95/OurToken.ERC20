//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "src/OurToken.sol";
import {DeployOurToken} from "script/DeployOurToken.s.sol";

contract TestOurToken is Test {
    DeployOurToken public deployer;
    OurToken public ourToken;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    uint256 transferAmount = 1000;
    uint256 initialAllowance = 1000;
    uint256 approvalAmount = 1000;

    uint256 public constant STARTING_BALANCE = 1000 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(address(msg.sender));
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAllowancesWorks() public {
        //ERC20 they have this function "transferFrom()"

        // bob approves alice to spend the tokens on her behalf

        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        vm.prank(alice);

        ourToken.transferFrom(bob, alice, transferAmount);
        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    /// Test: Check the initial supply
    function testInitialSupply() public view {
        assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    /// Test: Allowance and approval
    function testAllowanceAndApprove() public {
        vm.prank(alice);
        ourToken.approve(bob, approvalAmount);

        assertEq(ourToken.allowance(alice, bob), approvalAmount);
    }

    /// Test: Users cannot transfer more than their balance
    function testCannotTransferMoreThanBalance() public {
        vm.prank(alice);
        vm.expectRevert();
        ourToken.transfer(bob, transferAmount + 1);
    }

    /// Test: Users cannot transferFrom more than allowance
    function testCannotTransferFromMoreThanAllowance() public {
        vm.prank(alice);
        ourToken.approve(bob, approvalAmount);

        vm.prank(bob);
        vm.expectRevert();
        ourToken.transferFrom(alice, bob, approvalAmount + 1);
    }
}
