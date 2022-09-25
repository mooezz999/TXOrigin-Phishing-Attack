// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Token {
    mapping(address => uint) values;
    event amounts(uint256);
    event contractAmount(uint256);

    function deposit() public payable {
        values[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(values[msg.sender] >= amount);
        values[msg.sender] -= amount;
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent);
    }

    function transfer(address _to, uint256 _amount) public payable {
        require(values[tx.origin] >= _amount);
        values[tx.origin] -= _amount;
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent);
    }

    function getAmount(address _address) public {
        uint256 myAmount = values[_address];
        emit amounts(myAmount);
    }

    function getContractAmount() public {
        emit contractAmount(address(this).balance);
    }
}
