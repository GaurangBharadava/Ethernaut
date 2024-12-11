// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Privacy} from "../src/Privacy.sol";
import {Script} from "forge-std/Script.sol";

contract PrivacySolution is Script {
    Privacy public privacy = Privacy(0xE68F968D90B5fd6981E779a612C87C6899a4eDeD);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 key = 0xa8f64c95289e6fa075f85167cf17b43adc1efc73ba67518f4a27acae5dfa4ab1;
        privacy.unlock(bytes16(key));
        vm.stopBroadcast();
    }
}
