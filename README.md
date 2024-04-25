# Blockchain-Based Voting System

This repository contains a Solidity smart contract for implementing a blockchain-based voting system. The contract allows voters to register, vote for candidates, and determines the winner based on the tally of votes.

## Features

- **Voter Registration**: Voters can register by providing their name, age, and citizenship status.
- **Candidate Addition**: Election administrators can add candidates to the ballot.
- **Voting**: Registered voters can cast their votes for their preferred candidates.
- **Winner Determination**: The contract calculates and displays the winner based on the highest number of votes received.

## Smart Contract Components

### Structs

- **Voter**: Stores information about each registered voter, including name, age, citizenship status, registration status, voting status, and voter ID.
- **Candidate**: Stores information about each candidate, including name and vote count.

### Functions

- **registerVoter**: Allows voters to register by providing their personal information.
- **addCandidate**: Enables election administrators to add candidates to the ballot.
- **vote**: Allows registered voters to cast their votes for candidates.
- **getWinner**: Calculates and returns the name of the winning candidate based on the tally of votes.

### Events

- **VoterRegistered**: Triggered when a voter successfully registers.
- **VoteCast**: Triggered when a voter casts their vote.

## Usage

1. Deploy the smart contract on a compatible blockchain network.
2. Register voters by calling the `registerVoter` function with the required parameters.
3. Add candidates to the ballot using the `addCandidate` function.
4. Voters cast their votes by calling the `vote` function with their voter ID and the ID of their chosen candidate.
5. After voting, call the `getWinner` function to determine the winning candidate.
