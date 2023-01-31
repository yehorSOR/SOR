pragma solidity ^0.7.0;

/**
 * @title Staking
 * @author k.devyatka
 * @license MIT
 */
contract Staking {
    address public owner;
    uint public totalStaked;

    constructor() public {
        owner = msg.sender;
    }

    function stake(uint amount) public payable {
        require(msg.value == amount, "Incorrect amount staked.");
        totalStaked += amount;
    }

    function unstake(uint amount) public {
        require(amount <= totalStaked, "Cannot unstake more than total staked.");
        totalStaked -= amount;
        msg.sender.transfer(amount);
    }

    function claim() public {
        // Add claim logic here
    }
}
