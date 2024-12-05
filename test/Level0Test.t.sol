// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Instance} from "../src/Level0.sol";
import {Level0Solution} from "../script/Level0Solution.s.sol";

contract Level0Test is Test {
    Instance public instance;
    Level0Solution public deployer;

    string private password = "ok";

    function setUp() public {
        instance = new Instance(password);
        deployer = new Level0Solution();
    }

    function testAuthenticate() public {
        instance.authenticate(password);
        assertEq(true, instance.getCleared());
    }
}
