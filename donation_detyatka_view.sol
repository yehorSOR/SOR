pragma solidity ^0.7.0;

// SPDX-License-Identifier: MIT
contract eth_dtasking_devyat {

    address public owner;
    uint public totalStaked;
    mapping(address => uint) public stakedAmounts;
    mapping(address => uint) public rewards;

    constructor() public {
        owner = msg.sender;
    }

    function stake(uint amount) public payable {
        require(msg.value == amount, "Incorrect amount staked.");
        totalStaked += amount;
        stakedAmounts[msg.sender] += amount;
    }

    function unstake(uint amount) public {
        require(amount <= stakedAmounts[msg.sender], "Cannot unstake more than total staked.");
        totalStaked -= amount;
        stakedAmounts[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }

    function claim() public {
        require(rewards[msg.sender] > 0, "No rewards to claim.");
        msg.sender.transfer(rewards[msg.sender]);
        rewards[msg.sender] = 0;
    }
}
