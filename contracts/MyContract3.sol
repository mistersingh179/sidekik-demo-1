// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract3 is Ownable {
    string public name = "FooToken";
    uint public decimals = 16;
    uint public lastTxDate;

    mapping(address => uint) public balances;
    event Transfer(address from, address to, uint amount);

    function updateName(bytes32 newNameInBytes) public{
        name = string(abi.encode(newNameInBytes));
    }

    function addBalance(address who) public payable {
        balances[who] += msg.value;
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount, "insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        lastTxDate = block.timestamp;
        emit Transfer(msg.sender, to, amount);
    }

    function bulkTransfer(address[] memory to, uint[] memory amount) public {
        require(to.length == amount.length, "input lengths are not the same");
        for(uint i=0;i<to.length;i++){
            transfer(to[i], amount[i]);
        }
    }

    function anotherBulkTransfer(address[] calldata to, uint[] calldata amount) public {
        require(to.length == amount.length, "input lengths are not the same");
        for(uint i=0;i<to.length;i++){
            transfer(to[i], amount[i]);
        }
    }

    function changeLastTxDate(uint input) public onlyOwner{
        lastTxDate = input;
    }
}