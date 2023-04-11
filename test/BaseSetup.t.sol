// SPDX-License-Identifier: MIT
pragma solidity >=0.8;

import {Utils} from "./Utils.sol";
import {Erc20} from "../contracts/Erc20.sol";
import {stdStorage, StdStorage, Test, console, StdAssertions} from "forge-std/Test.sol";

contract BaseSetup is Test {
    Utils internal utils;
    Erc20 internal erc20;

    address payable[] internal users;
    address internal owner;
    address internal dev;

    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(10);
        owner = users[0];
        dev = users[1];

        vm.prank(owner);
        crowdFunding = new Erc20();
    }
}
