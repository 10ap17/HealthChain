// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {MedicalRecord} from "../src/MedicalRecord.sol";

contract DeployFundMe is Script {
    function run() external returns (MedicalRecord) {
        vm.startBroadcast();

        MedicalRecord record= new MedicalRecord();
        
        vm.stopBroadcast();
        return record;
    }
}