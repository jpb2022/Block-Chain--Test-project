# NFT Fundraiser

A decentralized NFT Fundraiser platform where users can donate Ether and receive a unique Non-Fungible Token (NFT) as a proof of their donation. The fundraiser will end when the total donation goal is met, and the campaign owner can withdraw the funds.

## Features

- **Donation and NFT Minting**: Users can donate Ether to the campaign and receive an NFT as a proof of donation.
- **Campaign Management**: The campaign owner can set a donation goal and withdraw the funds after the campaign ends.
- **Fundraiser Status**: Displays the current status of the fundraiser, including total funds raised and whether the fundraiser is ongoing or ended.
- **Token Tracking**: Each donor receives a unique NFT token ID after donation.

## Table of Contents

- [Technologies Used](#technologies-used)
- [Smart Contract Overview](#smart-contract-overview)
- [Frontend Overview](#frontend-overview)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [License](#license)

## Technologies Used

- **Ethereum**: The contract is deployed on the Ethereum blockchain.
- **Solidity**: The smart contract is written in Solidity.
- **OpenZeppelin**: For secure and standardized contract implementations like ERC721 for NFTs.
- **Web3.js**: For interacting with the Ethereum blockchain and MetaMask wallet.
- **HTML/CSS/JavaScript**: For the frontend interface.

## Smart Contract Overview

### `NFTFundraiser` Contract

- **ERC721 Token**: The contract inherits from the `ERC721` standard, allowing donors to receive a unique NFT as proof of donation.
- **Donation Functionality**: Donors can donate Ether and automatically receive an NFT minted to their wallet.
- **Fund Withdrawal**: The campaign owner can withdraw funds after the campaign ends (once the donation goal is met).
- **Campaign Status**: The contract keeps track of the total funds raised, the donation goal, and the status of the fundraiser.

### Key Functions:

1. **donateAndMintNFT()**: Allows users to donate Ether and receive an NFT.
2. **withdrawFunds()**: Allows the campaign owner to withdraw the raised funds after the goal is met.
3. **totalFundsRaised**: Returns the total amount of Ether raised so far.
4. **donationGoal**: The target amount of Ether to raise for the campaign.
5. **fundraiserEnded**: A boolean indicating whether the fundraiser has ended.

### Key Events:

- **DonationMade**: Triggered when a user donates and receives an NFT.
- **FundsWithdrawn**: Triggered when the campaign owner withdraws funds.

## Frontend Overview

The frontend is a simple web interface where users can:

- **Donate Ether**: Users can input a donation amount in Ether and click a button to donate.
- **Mint NFT**: After donation, users receive an NFT as proof of their donation.
- **View Campaign Status**: Users can see the total funds raised, donation goal, and whether the fundraiser has ended.
- **See Token ID**: After donating, users can view their unique NFT token ID.

The frontend communicates with the smart contract through **Web3.js** and **MetaMask**. Users are required to connect their MetaMask wallet to interact with the contract.

## Setup Instructions

### Prerequisites

- **Node.js**: Make sure you have Node.js installed (preferably version 12+).
- **MetaMask**: A MetaMask wallet installed in your browser.
- **Ethereum Network**: The contract is deployed on Ethereum, but you can test it on networks like Rinkeby, Ropsten, or local testnets (like Ganache).

### Frontend Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/nft-fundraiser.git
   cd nft-fundraiser
   ```

2. **Install dependencies**:

   ```bash
   npm install
   ```

3. **Update Contract Address and ABI**:

   - Replace `YOUR_CONTRACT_ADDRESS` in `index.html` with the actual address of your deployed contract.
   - Update the contract ABI in `index.html` with the correct ABI (Application Binary Interface) of the deployed contract.

4. **Run the frontend**:
   - Open `index.html` in your web browser. Ensure your MetaMask is connected to the correct Ethereum network where your contract is deployed.

### Smart Contract Deployment

1. **Compile and Deploy the Contract**:

   - Use **Remix IDE** or **Truffle** to compile and deploy the contract.
   - Make sure the campaign owner (the address deploying the contract) is set correctly.
   - After deploying, copy the contract address and paste it into the frontend code.

2. **Verify the Deployment**:
   - Check the contract deployment on [Etherscan](https://etherscan.io/) using the contract address to confirm it's live and working.

## Usage

1. **Donate to the Fundraiser**:

   - Enter the donation amount in Ether (ETH).
   - Click on the "Donate and Mint NFT" button.
   - A MetaMask popup will appear for you to confirm the transaction.
   - After the donation is processed, you will receive a unique NFT in your MetaMask wallet.

2. **View Fundraiser Status**:

   - The campaign status, total funds raised, and donation goal are updated in real-time on the frontend.

3. **Campaign Owner**:
   - Once the goal is reached, the campaign owner can withdraw the funds.
   - The "Withdraw Funds" option will become available for the campaign owner after the fundraiser ends.

## License

This project is licensed under the MIT License.

---

Feel free to customize the README to fit your needs or any additional features you add. Let me know if you need help with anything else!
