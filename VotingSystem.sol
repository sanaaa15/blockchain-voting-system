// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//helllllllllllllllllloooooooooooooooooooooooooooooooooooooooooooooo
contract VotingSystem {
    // Struct to represent a voter
    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint256 votedProposalId;
    }

    // Struct to represent a proposal
    struct Proposal {
        string description;
        uint256 voteCount;
    }

    // Mapping to store voters
    mapping(address => Voter) public voters;

    // Array to store proposals
    Proposal[] public proposals;

    // Event to notify when a voter has voted
    event VoterRegistered(address voterAddress);
    event Voted(address voterAddress, uint256 proposalId);

    // Function to register a voter
    function registerVoter() public {
        require(!voters[msg.sender].isRegistered, "Voter is already registered.");
        voters[msg.sender].isRegistered = true;
        emit VoterRegistered(msg.sender);
    }

    // Function to add a proposal
    function addProposal(string memory description) public {
        proposals.push(Proposal(description, 0));
    }

    // Function to vote for a proposal
    function vote(uint256 proposalId) public {
        require(voters[msg.sender].isRegistered, "Only registered voters can vote.");
        require(!voters[msg.sender].hasVoted, "Voter has already voted.");
        require(proposalId < proposals.length, "Invalid proposal ID.");

        voters[msg.sender].hasVoted = true;
        voters[msg.sender].votedProposalId = proposalId;
        proposals[proposalId].voteCount++;

        emit Voted(msg.sender, proposalId);
    }

    // Function to get the winning proposal
    function getWinningProposal() public view returns (uint256 winningProposalId) {
        uint256 maxVotes = 0;
        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > maxVotes) {
                maxVotes = proposals[i].voteCount;
                winningProposalId = i;
            }
        }
    }
}
