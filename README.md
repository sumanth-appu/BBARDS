# Student Result Display System on Blockchain

## Overview

The Student Result Display System is a decentralized application built on the Ethereum blockchain. It enables students, professors, and company employees to interact with student records securely and transparently. Student results are stored on the blockchain, and IPFS is used for decentralized document storage.

### Key Features

- **Student Records**: Manage student names and documents on the blockchain.
- **Professor Role**: Add student records and upload marksheets.
- **Company Employee Role**: View student records using a student’s public key.
- **Decentralized Storage**: Utilizes IPFS for document storage.

## Setup

### Prerequisites

- Node.js and npm installed
- Solidity and Remix IDE for smart contract development
- IPFS service (e.g., Infura, Pinata)

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/student-result-system.git
   cd student-result-system

2. **Install Dependencies**
    ```bash
    npm install


3.**Compile the Smart Contract**

### Use Remix IDE or Truffle to compile your Solidity smart contract:

- Open Remix IDE in your browser.
- Create a new Solidity file (.sol) and paste your contract code.
- Compile the contract using the Solidity compiler.
- Deploy the Smart Contract

4. **Deploy your smart contract to a test network (e.g., Rinkeby) using Remix IDE or Truffle:**

### In Remix IDE, go to the "Deploy & Run Transactions" tab.
- Select the environment (Injected Web3 for Rinkeby).
- Deploy the contract and note the contract address.
5. **Configure IPFS**

- Sign up for an IPFS service (Pinata).
- Obtain your API key and configure it in your project.

### Usage
1. **Add a Student Record**

    Use the web interface to add a student record. Provide the student’s Ethereum address, name, and IPFS hash.

2. **View Student Records**

    Enter the student’s Ethereum address in the web interface to fetch and display their name and associated document.

3. **Upload Marksheets**

    Upload marksheets to IPFS and use the generated IPFS hash to link the document with a student’s record.

- Email: sumanthappu@outlook.com.com
- GitHub: sumanth

