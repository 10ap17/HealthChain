// SPDX-License-Identifier: MIT

/*
 .--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--. 
/ .. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \
\ \/\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ \/ /
 \/ /`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'\/ / 
 / /\                                                                        / /\ 
/ /\ \   __  __          _ _           _   ____                        _    / /\ \
\ \/ /  |  \/  | ___  __| (_) ___ __ _| | |  _ \ ___  ___ ___  _ __ __| |   \ \/ /
 \/ /   | |\/| |/ _ \/ _` | |/ __/ _` | | | |_) / _ \/ __/ _ \| '__/ _` |    \/ / 
 / /\   | |  | |  __/ (_| | | (_| (_| | | |  _ <  __/ (_| (_) | | | (_| |    / /\ 
/ /\ \  |_|  |_|\___|\__,_|_|\___\__,_|_| |_| \_\___|\___\___/|_|  \__,_|   / /\ \
\ \/ /                                                                      \ \/ /
 \/ /                                                                        \/ / 
 / /\.--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--./ /\ 
/ /\ \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \/\ \
\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `' /
 `--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'                                                                             
                                                                                                                                                     
*/
import '../lib/openzeppelin-contracts/contracts/access/Ownable.sol';

pragma solidity ^0.8.25;

contract MedicalRecord is Ownable{

    event PatientAdded();
    event DoctorAdded();

    event PatientUpdated();
    event DoctorUpdated();

    error NotDoctor();

    struct Patient{
        string name;
        bool gender;
        string homeAddress;
        uint256 age;
        uint256 height;
        uint256 weight;
        string allergies;
        string contact;
        
    }

    struct Doctor{
        string name;
        bool gender;
        string specialization;
        string contact;
        uint256 licenseId;
    }

    struct Appointment{
        address doctor;
        address patient;
        string date;
        string time;
        string location;

    }

    mapping(address=>Patient) public patient;
    mapping(address=>Doctor) public doctor;
    mapping(address=> bool) public isDoctor;
    Appointment[] public appointment;
    uint256 public patientCounter;
    uint256 public doctorCounder;
    uint256 public appointmentCounter;
    uint256 public appointmentId;

    modifier ownerOrDocotr(){
        require(isDoctor[msg.sender] == true || msg.sender == owner());
        _;
    }
    
    constructor() Ownable(msg.sender) {}

    function addPatient(address _patientAddress, string memory _name,bool _gender,string memory _homeAddress,uint256 _age,uint256 _height,uint256 _weight,string memory _allergies,string memory _contact)external onlyOwner{
         Patient memory newPatient = Patient({
            name: _name,
            gender: _gender,
            homeAddress: _homeAddress,
            age: _age,
            height: _height,
            weight: _weight,
            allergies: _allergies,
            contact: _contact
        });

        // Add the new patient to the mapping
        patient[_patientAddress] = newPatient;
        patientCounter++;

        emit PatientAdded();
    }

    function addDoctor(address _doctorAddress, string memory _name, bool _gender, string memory _specialization,string memory _contact,uint256 _licenseId)external onlyOwner{
         Doctor memory newDoctor = Doctor({
            name: _name,
            gender: _gender,
            specialization: _specialization,
            contact: _contact,
            licenseId: _licenseId
            
        });

        // Add the new patient to the mapping
        doctor[_doctorAddress] = newDoctor;
        isDoctor[_doctorAddress] = true;
        doctorCounder++;

        emit DoctorAdded();
    }

    function addAppointment(address _doctorAddress, address _patientAddress, string memory _date, string memory _time, string memory _location)external{
        if(!isDoctor[_doctorAddress]){
            revert NotDoctor();
        }

         Appointment memory newAppointment = Appointment({
            doctor: _doctorAddress,
            patient: _patientAddress,
            date: _date,
            time: _time,
            location: _location
            
        });
        appointment[appointmentId]= newAppointment;
        appointmentCounter++;
        appointmentId++;

    }

    function updatePatient(address _patientAddress, string memory _name,bool _gender,string memory _homeAddress,uint256 _age,uint256 _height,uint256 _weight,string memory _allergies,string memory _contact)external ownerOrDocotr{
        Patient memory patientToUpdate= patient[_patientAddress];
        patientToUpdate.name = _name;
        patientToUpdate.gender = _gender;
        patientToUpdate.homeAddress = _homeAddress;
        patientToUpdate.age = _age;
        patientToUpdate.height = _height;
        patientToUpdate.weight = _weight;
        patientToUpdate.allergies = _allergies;
        patientToUpdate.contact = _contact;

        emit PatientUpdated();
    }

     function updateDoctor(address _doctorAddress, string memory _name, bool _gender, string memory _specialization,string memory _contact,uint256 _licenseId)external ownerOrDocotr{
        Doctor memory doctorToUpdate= doctor[_doctorAddress];
        doctorToUpdate.name = _name;
        doctorToUpdate.gender = _gender;
        doctorToUpdate.specialization = _specialization;
        doctorToUpdate.contact = _contact;
        doctorToUpdate.licenseId = _licenseId;
       
        emit DoctorUpdated();
    }
    /*//////////////////////////////////////////////////////////////
                             VIEW FUNCTIONS
    //////////////////////////////////////////////////////////////*/
    function getPatient(address _patientAddress)external view returns(Patient memory){
        return patient[_patientAddress];
    }

    function getDoctor(address _doctorAddress)external view returns(Doctor memory){
        return doctor[_doctorAddress];
    }

    function getAppointment(uint256 _appointmentId) external view returns(Appointment memory){
        return appointment[_appointmentId];
    }

    function getPatientsCount()external view returns(uint256){
        return patientCounter;
    }

    function getDoctorsCount()external view returns(uint256){
        return doctorCounder;
    }

    function getAppointmentCount()external view returns(uint256){
        return appointmentCounter;
    }
}