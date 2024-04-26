# Blockchain Voting System

This is a simple blockchain-based voting system with a frontend built using HTML, CSS, and JavaScript. The backend smart contract is written in Solidity and deployed on the Ethereum blockchain. The system allows users to register voters, add candidates, and cast votes, and provides a way to view the winner based on the highest vote count.

## Technologies Used
- Solidity for the smart contract.
- HTML, CSS, and JavaScript for the frontend.
- MetaMask for connecting to the Ethereum blockchain.
- Remix IDE for contract compilation and deployment.

## Getting Started

### Prerequisites
- MetaMask extension installed in your web browser.
- Remix IDE for Solidity development and deployment.
- Live server extension in your IDE or a similar tool to run the frontend.

### Deploying the Smart Contract
1. **Open Remix IDE**:
   - Navigate to [Remix IDE](https://remix.ethereum.org/).
   
2. **Create a Solidity File**:
   - Create a new file in Remix with a `.sol` extension (e.g., `VotingSystem.sol`).
   - Paste your Solidity smart contract code into this file.

3. **Compile the Contract**:
   - Click on the Solidity Compiler tab (the third icon on the left).
   - Select the correct Solidity version (e.g., `0.8.0`).
   - Click "Compile" to compile the contract.

4. **Copy the ABI**:
   - After compilation, expand the contract and copy the ABI (JSON format) from the Solidity Compiler tab.

5. **Deploy the Contract**:
   - Click on the "Deploy & Run Transactions" tab (the fourth icon on the left).
   - Select "Injected Provider - MetaMask" to connect to MetaMask.
   - Ensure MetaMask is connected to a network like "Ganache" or a testnet.
   - Select the compiled contract, set any constructor arguments if needed, and click "Deploy".
   - Copy the contract address from the deployed contract.

### Setting Up the Frontend
1. **Open the HTML File**:
   - Open the HTML file containing the frontend in your preferred IDE.

2. **Insert Contract ABI and Address**:
   - In the script section, replace `YOUR_CONTRACT_ADDRESS` with the contract address you copied earlier.
   - Replace the placeholder for the ABI with the copied ABI from Remix.

3. **Run the HTML File on a Live Server**:
   - If using VS Code, use the "Live Server" extension to run the HTML file.
   - If using another IDE or tool, run the HTML file on a live server to ensure proper interaction with MetaMask.

### Using the Voting System
1. **Register a Voter**:
   - Open the HTML file in your web browser.
   - Fill out the "Register Voter" form with the voter's details (name, age, and "Is Indian?" checkbox).
   - Click "Register" to add the voter to the blockchain.

2. **Add a Candidate**:
   - Fill out the "Add Candidate" form with the candidate's name.
   - Click "Add" to add the candidate to the blockchain.

3. **Vote for a Candidate**:
   - In the "Vote" section, select the voter ID and the candidate ID from the dropdown.
   - Click "Vote" to cast a vote for the chosen candidate.

4. **Get the Winner**:
   - Click the "Get Winner" button to retrieve the name of the candidate with the most votes.

## Troubleshooting
- If you encounter issues with MetaMask, ensure it's connected to the correct network and has sufficient test Ether for transaction fees.
- If the frontend does not interact with the contract, double-check the contract address and ABI to ensure they are correct.
- If deploying on a testnet, ensure the network has sufficient block confirmations before interacting with the contract.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
