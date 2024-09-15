// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarksheetSystem {
    // Define structures for Marksheet and Certificate
    struct Marksheet {
        string studentName;
        string subject;
        uint256 marks;
        string ipfsHash;
    }

    struct Certificate {
        string certName;
        string ipfsHash;  // Store certificate IPFS hash
        bool isValid;     // Certificate validity
    }

    // Declare Admin, and Mappings for Students and Employers
    address public admin;
    mapping(address => Marksheet[]) public studentMarksheets;
    mapping(address => Certificate[]) public studentCertificates;
    mapping(address => bool) public employers;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    modifier onlyEmployer() {
        require(employers[msg.sender], "You are not a registered employer");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Self-register for employers
    function selfRegisterEmployer() public {
        require(!employers[msg.sender], "Already registered as an employer");
        employers[msg.sender] = true;
    }

    // Upload Marksheet for Students
    function uploadMarksheet(
        address _student,
        string memory _studentName,
        string memory _subject,
        uint256 _marks,
        string memory _ipfsHash
    ) public onlyAdmin {
        studentMarksheets[_student].push(Marksheet(_studentName, _subject, _marks, _ipfsHash));
    }

    // Upload Certificate for Students
    function uploadCertificate(
        address _student,
        string memory _certName,
        string memory _ipfsHash
    ) public onlyAdmin {
        studentCertificates[_student].push(Certificate(_certName, _ipfsHash, true));
    }

    // Verify Certificate using IPFS Hash
    function verifyCertificate(address _student, string memory _ipfsHash) public view returns (bool) {
        Certificate[] memory certificates = studentCertificates[_student];
        for (uint i = 0; i < certificates.length; i++) {
            if (keccak256(abi.encodePacked(certificates[i].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash))) {
                return certificates[i].isValid;
            }
        }
        return false;
    }

    // View Student Marksheets for Employers
    function viewStudentMarksheets(address _student) public view onlyEmployer returns (Marksheet[] memory) {
        return studentMarksheets[_student];
    }

    // View Student Certificates for Employers
    function viewStudentCertificates(address _student) public view onlyEmployer returns (Certificate[] memory) {
        return studentCertificates[_student];
    }
}
