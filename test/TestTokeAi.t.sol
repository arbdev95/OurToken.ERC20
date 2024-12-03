// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";
import {Test, console} from "forge-std/Test.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address public user1 = address(0x123);
    address public user2 = address(0x456);
    uint256 public transferAmount = 1000 * 10 ** 18;
    uint256 public approvalAmount = 2000 * 10 ** 18;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        // Fund user1 with some tokens for transfer tests
        vm.prank(msg.sender);
        ourToken.transfer(user1, transferAmount);
    }

    /// Test: Check the initial supply
    function testInitialSupply() public view {
        assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    /// Test: Transfer between accounts
    function testTransfer() public {
        vm.prank(user1);
        ourToken.transfer(user2, transferAmount / 2);

        assertEq(ourToken.balanceOf(user1), transferAmount / 2);
        assertEq(ourToken.balanceOf(user2), transferAmount / 2);
    }

    /// Test: Allowance and approval
    function testAllowanceAndApprove() public {
        vm.prank(user1);
        ourToken.approve(user2, approvalAmount);

        assertEq(ourToken.allowance(user1, user2), approvalAmount);
    }

    /// Test: Transfer from using allowance
    function testTransferFrom() public {
        vm.prank(user1);
        ourToken.approve(user2, approvalAmount);

        vm.prank(user2);
        ourToken.transferFrom(user1, user2, approvalAmount / 2);

        assertEq(ourToken.allowance(user1, user2), approvalAmount / 2);
        assertEq(
            ourToken.balanceOf(user1),
            transferAmount - approvalAmount / 2
        );
        assertEq(ourToken.balanceOf(user2), approvalAmount / 2);
    }

    /// Test: Users cannot transfer more than their balance
    function testCannotTransferMoreThanBalance() public {
        vm.prank(user1);
        vm.expectRevert();
        ourToken.transfer(user2, transferAmount + 1);
    }

    /// Test: Users cannot transferFrom more than allowance
    function testCannotTransferFromMoreThanAllowance() public {
        vm.prank(user1);
        ourToken.approve(user2, approvalAmount);

        vm.prank(user2);
        vm.expectRevert();
        ourToken.transferFrom(user1, user2, approvalAmount + 1);
    }
}
