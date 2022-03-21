// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

/**
 * Implements Wrapped TPC as ERC20 token.
 *
 * The local TPC pool size will always match the total supply of wTPC tokens
 * since they are minted on deposit and burned on withdraw in 1:1 ratio.
 */
contract WrappedTpc is ERC20, ERC20Detailed, ERC20Pausable {
	// Error Code: No error.
	uint256 public constant ERR_NO_ERROR = 0x0;

	// Error Code: Non-zero value expected to perform the function.
	uint256 public constant ERR_INVALID_ZERO_VALUE = 0x01;

    // create instance of the wTPC token
    constructor () public ERC20Detailed("Wrapped TechPay", "WTPC", 18) {
    }

    // deposit wraps received TPC tokens as wTPC in 1:1 ratio by minting
    // the received amount of TPCs in wTPC on the sender's address.
    function deposit() public whenNotPaused payable returns (uint256) {
    	// there has to be some value to be converted
    	if (msg.value == 0) {
    		return ERR_INVALID_ZERO_VALUE;
    	}

    	// we already received TPCs, mint the appropriate amount of wTPC
    	_mint(msg.sender, msg.value);

    	// all went well here
    	return ERR_NO_ERROR;
    }

    // withdraw unwraps TPC tokens by burning specified amount
    // of wTPC from the caller address and sending the same amount
    // of TPCs back in exchange.
    function withdraw(uint256 amount) public whenNotPaused returns (uint256) {
    	// there has to be some value to be converted
    	if (amount == 0) {
    		return ERR_INVALID_ZERO_VALUE;
    	}

    	// burn wTPC from the sender first to prevent re-entrance issue
    	_burn(msg.sender, amount);

    	// if wTPC were burned, transfer native tokens back to the sender
    	msg.sender.transfer(amount);

    	// all went well here
    	return ERR_NO_ERROR;
    }
}
