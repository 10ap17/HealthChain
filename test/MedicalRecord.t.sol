// SPDX-License-Identifier: GPL-3.0
pragma solidity^ 0.8.24;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {MedicalRecord} from "../src/MedicalRecord.sol";

contract MondrianTest is Test {
    MedicalRecord record;

    function setUp() public {
       record= new MedicalRecord();
    }

    function testAddingDoctor() external{
        record.addDoctor(address(this), "Aleksa", true, "Pharmacist", "panticaleksa1710@gmail.com", 1);
    }

    function testDoctorCounter()external{
        record.addDoctor(address(this), "Aleksa", true, "Pharmacist", "panticaleksa1710@gmail.com", 1);
        vm.assertEq(record.getDoctorsCount(), 1);
    }
    
    
}