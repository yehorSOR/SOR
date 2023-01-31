pragma solidity ^0.8.1;
// SPDX-License-Identifier: MIT
contract SimpleContract {
    uint public value;

    constructor(uint _value) public {
        value = _value;
    }

    function setValue(uint _value) public {
        value = _value;
    }

    function getValue() public view returns (uint) {
        return value;
    }
}
