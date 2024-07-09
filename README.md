# HealtChain
```text
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
```                                     
## Table of Contents
~ [Requirements](#requirements)

~ [About](#about)

~ [Functionalities](#functionalities)

## <a name="requirements"></a>Requirements
To work with this repository, you need to fulfill the following requirements:

Install Foundry:
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```
Clone the HealthChain repository to your local machine using Git:
```bash
git clone https://github.com/10ap17/HealthChain.git
cd damn-vulnerable-defi-foundry
```
Ensure that you have all the required dependencies installed to run the tests. You can install dependencies by running:
```bash
forge install
```
To test, you can use the following command:
```bash
forge test
```
Ensure that you meet these requirements before proceeding with any operations or testing within the HealthChain project.

## <a name="about"></a>About
Welcome to the Medical Record Blockchain Project! This innovative initiative aims to revolutionize the healthcare industry by enhancing transparency, security, and efficiency in medical record management. Leveraging blockchain technology, this project provides a decentralized and immutable platform for storing patient and doctor information, ensuring data integrity and accessibility.

In traditional healthcare systems, managing and sharing medical records can be cumbersome, prone to errors, and vulnerable to unauthorized access. By adopting blockchain technology, we address these challenges by creating a secure and transparent environment where patients, doctors, and healthcare providers can interact seamlessly. This project enables the efficient storage of medical records, verification of doctor credentials, and the setup of appointments, all while maintaining the highest standards of data privacy and security.

## <a name="functionalities"></a> Functionalities
The `MedicalRecord` smart contract is designed to manage medical records securely and efficiently. It includes functionalities for managing `patients`, `doctors`, and `appointments.

The contract allows the `owner` to add new `patients` using the `addPatient function`, which takes the patient's address, name, gender, home address, age, height, weight, allergies, and contact information as parameters. The patient information is stored in a mapping and an event `PatientAdded` is emitted when a new patient is added.

```solidity
function addPatient(address _patientAddress, string memory _name,bool _gender,string memory _homeAddress,uint256 _age,uint256 _height,uint256 _weight,string memory _allergies,string memory _contact) external onlyOwner {
    // to see the implementation see the contract
}
```
`Doctors` can be added similarly using the `addDoctor` function, which requires the doctor's address, name, gender, specialization, contact information, and license ID. This function also updates a mapping and emits a `DoctorAdded` event.

```solidity
function addDoctor(address _doctorAddress, string memory _name, bool _gender, string memory _specialization, string memory _contact, uint256 _licenseId) external onlyOwner {
    // to see the implementation see the contract
}
```
`Appointments` can be created with the `addAppointment` function, which takes the doctor's address, patient's address, date, time, and location of the appointment as parameters. This function checks if the doctor is registered and then stores the appointment details in an array, emitting an `AppointmentUpdated` event upon successful creation.

```solidity
function addAppointment(address _doctorAddress, address _patientAddress, string memory _date, string memory _time, string memory _location) external {
    // to see the implementation see the contract
}
```
The contract also allows updating `patient` and `doctor` information through the `updatePatient` and `updateDoctor` functions respectively. These functions can be called by either the `owner` or a registered `doctor`, as enforced by the `ownerOrDocotr` modifier. Upon updating, the corresponding events `PatientUpdated` and `DoctorUpdated` are emitted.

```solidity
function updatePatient(address _patientAddress, string memory _name, bool _gender, string memory _homeAddress, uint256 _age, uint256 _height, uint256 _weight, string memory _allergies, string memory _contact) external ownerOrDocotr {
    // to see the implementation see the contract
}

function updateDoctor(address _doctorAddress, string memory _name, bool _gender, string memory _specialization, string memory _contact, uint256 _licenseId) external ownerOrDocotr {
    // to see the implementation see the contract
}
```
Additionally, the contract provides functions to view `patient`, `doctor`, and `appointment` details using `getPatient`, `getDoctor`, and `getAppointment` respectively. It also includes functions to get the total count of `patients`, `doctors`, and `appointments`: `getPatientsCount`, `getDoctorsCount`, and `getAppointmentCount`.