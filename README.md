
# **OurToken (OT)**

Welcome to the official repository for **OurToken (OT)**, an ERC20-compliant token built with Solidity. This token is designed as a simple implementation of the ERC20 standard and can be used as a foundation for various blockchain applications.

---

## **Table of Contents**
1. [Overview](#overview)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Development](#development)
6. [Testing](#testing)
7. [License](#license)

---

## **Overview**
OurToken (OT) is an ERC20 token implemented using OpenZeppelin's well-audited libraries to ensure security and reliability. This project demonstrates the basics of deploying and interacting with an ERC20 token contract on the Ethereum blockchain.

---

## **Features**
- **Compliant with ERC20 Standard:** Ensures compatibility with wallets, exchanges, and other blockchain tools.
- **Initial Supply:** The total supply is minted to the deployer's address during contract deployment.
- **Customizable Parameters:** Token name and symbol are customizable (`OurToken` and `OT` in this implementation).
- **OpenZeppelin Library:** Built with the industry-standard OpenZeppelin ERC20 implementation for security and reliability.

---

## **Installation**

To use or develop this project, follow the steps below:

### **Prerequisites**
1. Install [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/).
2. Install [Foundry](https://book.getfoundry.sh/) for smart contract development.
3. Install [Git](https://git-scm.com/) for version control.

### **Clone the Repository**
```bash
git clone https://github.com/your-username/our-token.git
cd our-token
```

### **Install Dependencies**
Install the required Solidity libraries and dependencies:
```bash
npm install
```

---

## **Usage**

### **Deploy the Contract**
To deploy the `OurToken` contract, use any Ethereum development environment (e.g., [Remix](https://remix.ethereum.org/), Hardhat, or Foundry). For Foundry:
1. Update the deployment script with the desired initial supply:
   ```solidity
   uint256 initialSupply = 1000 * 10 ** 18; // Example: 1,000 tokens with 18 decimals
   ```
2. Deploy the contract:
   ```bash
   forge script script/DeployOurToken.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
   ```

### **Interacting with the Token**
Once deployed, you can:
- **Check the total supply:**
  ```solidity
  ourToken.totalSupply();
  ```
- **Transfer tokens:**
  ```solidity
  ourToken.transfer(recipientAddress, amount);
  ```
- **Approve spending:**
  ```solidity
  ourToken.approve(spenderAddress, amount);
  ```
- **Check balances:**
  ```solidity
  ourToken.balanceOf(walletAddress);
  ```

---

## **Development**

### **Project Structure**
- **`contracts/`**: Contains the Solidity source code.
- **`test/`**: Contains test scripts for the token.
- **`script/`**: Deployment and utility scripts.

### **Setup Development Environment**
1. Install [Foundry](https://book.getfoundry.sh/getting-started/installation.html).
2. Build the project:
   ```bash
   forge build
   ```

---

## **Testing**
Write and run tests to ensure the token functions as expected.

### **Run Tests**
To run tests, execute:
```bash
forge test
```

### **Sample Test Cases**
Tests include:
- Verifying the initial supply is minted to the deployer.
- Ensuring ERC20 standard functions like `transfer`, `approve`, and `allowance` work correctly.
- Testing edge cases such as exceeding balances or allowances.

---

## **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **Contributing**
We welcome contributions to improve OurToken. Please:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with detailed changes.

---

## **Acknowledgments**
- **[OpenZeppelin](https://openzeppelin.com/):** For providing secure and reusable smart contract libraries.
- **[Foundry](https://book.getfoundry.sh/):** For simplifying smart contract development.

---

## **Contact**
For questions or feedback, please open an issue or reach out via [Your Twitter/Email/LinkedIn].

---

This repository serves as a starting point for developing your custom token. Feel free to customize and expand upon it as needed! 🚀
