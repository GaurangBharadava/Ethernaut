// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Instance} from "../src/Level0.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";

contract Level0Solution is Script {
    Instance public level0 = new Instance("0x39a2A098Be317ba2460135604BA7e481384cDA7e");

    function run() external {
        string memory password = level0.password();
        console.log("password: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}
