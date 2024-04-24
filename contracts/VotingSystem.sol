// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Voter {
        bool isRegistered;
        bytes32 voterKey;
    }

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(address => Voter) public voters;
    Candidate[] public candidates;

    event VoterRegistered(address voterAddress, bytes32 voterKey);
    event VoteCast(address voterAddress, string candidate);

    function registerVoter() public returns (bytes32 voterKey) {
        require(!voters[msg.sender].isRegistered, "Already registered");
        voterKey = keccak256(abi.encodePacked(msg.sender, block.timestamp));
        voters[msg.sender] = Voter(true, voterKey);
        emit VoterRegistered(msg.sender, voterKey);
    }

    function addCandidate(string memory name) public {
        candidates.push(Candidate(name, 0));
    }

    function vote(bytes32 voterKey, uint256 candidateIndex) public {
        Voter storage voter = voters[msg.sender];
        require(voter.isRegistered, "Not registered");
        require(voter.voterKey == voterKey, "Invalid voter key");
        require(candidateIndex < candidates.length, "Invalid candidate");
        candidates[candidateIndex].voteCount++;
        emit VoteCast(msg.sender, candidates[candidateIndex].name);
    }

    function getWinningCandidate() public view returns (string memory) {
        uint256 maxVotes = 0;
        uint256 winningIndex;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winningIndex = i;
            }
        }
        return candidates[winningIndex].name;
    }
}