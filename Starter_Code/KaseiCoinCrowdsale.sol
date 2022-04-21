pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Kasei_tokenCrowdsale contract will inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract Kasei_tokenCrowdsale is Crowdsale, MintedCrowdsale{ // UPDATED THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provided parameters for all of the features of crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        uint rate;
        address payable wallet;
        kasei_Token token;
    ) public Crowdsale(rate, wallet, token) {
        // constructor can stay empty
    }
}


contract Kasei_tokenCrowdsaleDeployer {
    // Created an `address public` variable called `kasei_token_address`.
    address public kasei_token_address;
    // Created an `address public` variable called `kasei_crowdsale_address`.
    address public kasei_crowdsale_address;

    // Added the constructor.
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    ) public {
        // Created a new instance of the KaseiCoin contract.
        kasie_Token token = new kasei_Token(name, symbol, 0)
        
        // Assigned the token contract’s address to the `kasei_token_address` variable.
        kasei_token_address = address(token);

        // Created a new instance of the `Kasei_tokenCrowdsale` contract
        Kasei_tokenCrowdsale kasei_crowdsale = new Kasei_tokenCrowdsale(1, wallet, token);
            
        // Assigned the `Kasei_tokenCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        kasei_crowdsale_address = address(Kasei_tokenCrowdsale);

        // Set the `Kasei_tokenCrowdsale` contract as a minter
        token.addMinter(Kasei_crowdsale_address);
        
        // Had the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        token.renounceMinter();
    }
}

        
