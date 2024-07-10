// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ERC20Token {

    string public name = "Genius Token";
    string public symbol = "GT";
    uint8 public decimals = 15;
    uint256 public totalAmount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint256) public AccountBalance;

    function mintToken(address to, uint256 amount) public {

        require(msg.sender == owner, "!! ALERT!!  Only the owner can mint tokens.");
        require(amount > 0, "Mint amount must be positive.");

        AccountBalance[to] += amount;
        totalAmount += amount;
    }

    function transferToken(address to, uint256 amount) public {

        require(amount <= AccountBalance[msg.sender], "Insufficient balance for transfer.");
        require(to != address(0), "Cannot send tokens to the zero address. Please enter the correct address.");

        AccountBalance[msg.sender] -= amount;
        AccountBalance[to] += amount;
    }

    function burnToken(address from, uint256 amount) public {

        require(amount <= AccountBalance[from], "Insufficient balance for burn.");

        AccountBalance[from] -= amount;
        totalAmount -= amount;
    }
}