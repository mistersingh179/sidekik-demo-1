// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is Ownable {
    string public name = "bar";
    function setName(bytes32 newName) public{
        name = string(abi.encode(newName));
    }
    uint public age = 100;
    uint public lastTxDate;

    event Transfer(address from, address to, uint amount);

    mapping(address => uint) public balances;

    function addBalance() public payable{
        balances[msg.sender] += msg.value;
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] > amount, "insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        lastTxDate = block.timestamp;
        emit Transfer(msg.sender, to, amount);
    }

    function bulkTransfer(address[] calldata tos, uint amount) public{
        for(uint i=0;i<tos.length;i++){
            transfer(tos[i], amount);
        }
    }

    function updateLastTxDate(uint newDate) public onlyOwner {
        lastTxDate = newDate;
    }
}
