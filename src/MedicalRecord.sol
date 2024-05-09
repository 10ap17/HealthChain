// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MedicalRecord{

    struct Patients{
        string name;
        bool gender;
        string homeAddress;
        uint256 age;
        uint256 height;
        uint256 weight;
        string alergies;
        string contact;
        
    }

    struct Doctors{
        string name;
        bool gender;
        string specialization;
        string contact;
        uint256 licenseId;
    }
    
}