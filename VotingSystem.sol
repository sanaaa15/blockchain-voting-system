// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Voter {
        string name;
        uint256 age;
        bool isIndian;
        bool isRegistered;
        bool hasVoted;
        uint256 voterId;
    }

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Voter) public voters;
    mapping(uint256 => Candidate) public candidates;
    uint256 public totalVoters;
    uint256 public totalCandidates;

    event VoterRegistered(uint256 voterId, string name);
    event VoteCast(uint256 voterId, uint256 candidateId);

    function registerVoter(string memory _name, uint256 _age, bool _isIndian) public {
        require(_age >= 18, "Voter must be at least 18 years old.");
        require(_isIndian, "Voter must be an Indian citizen.");

        voters[totalVoters] = Voter(_name, _age, _isIndian, true, false, totalVoters);
        emit VoterRegistered(totalVoters, _name);
        totalVoters++;
    }

    function addCandidate(string memory _name) public {
        candidates[totalCandidates] = Candidate(_name, 0);
        totalCandidates++;
    }

    function getVotersList() public view returns (Voter[] memory) {
        Voter[] memory voterList = new Voter[](totalVoters);
        for (uint256 i = 0; i < totalVoters; i++) {
            voterList[i] = voters[i];
        }
        return voterList;
    }

    function getCandidatesList() public view returns (Candidate[] memory) {
        Candidate[] memory candidateList = new Candidate[](totalCandidates);
        for (uint256 i = 0; i < totalCandidates; i++) {
            candidateList[i] = candidates[i];
        }
        return candidateList;
    }

    function vote(uint256 _voterId, uint256 _candidateId) public {
        require(voters[_voterId].isRegistered, "Voter is not registered.");
        require(!voters[_voterId].hasVoted, "Voter has already voted.");
        require(_candidateId < totalCandidates, "Invalid candidate ID.");

        voters[_voterId].hasVoted = true;
        candidates[_candidateId].voteCount++;
        emit VoteCast(_voterId, _candidateId);
    }

    function getWinner() public view returns (string memory) {
        uint256 maxVotes = 0;
        uint256 winnerIndex = 0;

        for (uint256 i = 0; i < totalCandidates; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        return candidates[winnerIndex].name;
    }
}
