// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTFundraiser is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    address public campaignOwner;
    uint256 public totalFundsRaised;
    uint256 public donationGoal;
    bool public fundraiserEnded;

    // Mapping to track donations made by each address
    mapping(address => uint256) public donorToAmount;

    // Event to log donations and NFT minting
    event DonationMade(address indexed donor, uint256 amount, uint256 tokenId);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    // Constructor to initialize the contract with a goal
    constructor(string memory campaignName, uint256 _donationGoal) ERC721(campaignName, "NFTF") {
        campaignOwner = msg.sender;
        donationGoal = _donationGoal;
        fundraiserEnded = false;
    }

    // Function 1: Donate and mint an NFT as a proof of donation
    function donateAndMintNFT() external payable {
        require(!fundraiserEnded, "Fundraiser has ended");
        require(msg.value > 0, "Donation must be greater than zero");

        // Log the donation
        donorToAmount[msg.sender] += msg.value;
        totalFundsRaised += msg.value;

        // Mint a unique NFT to the donor
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, tokenId);
        _tokenIdCounter.increment();

        // Emit the donation and mint event
        emit DonationMade(msg.sender, msg.value, tokenId);

        // If the goal is reached, end the fundraiser
        if (totalFundsRaised >= donationGoal) {
            fundraiserEnded = true;
        }
    }

    // Function 2: Withdraw the funds raised by the campaign owner
    function withdrawFunds() external {
        require(msg.sender == campaignOwner, "Only the campaign owner can withdraw");
        require(fundraiserEnded, "Fundraiser is not yet ended");
        require(address(this).balance > 0, "No funds to withdraw");

        uint256 amount = address(this).balance;
        payable(campaignOwner).transfer(amount);

        // Emit the funds withdrawn event
        emit FundsWithdrawn(campaignOwner, amount);
    }
}
