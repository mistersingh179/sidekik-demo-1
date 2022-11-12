// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract2  {
//contract MyContract is Ownable {
    string public name = "IAmMyContract3";
//    uint public age = 100;
    uint public decimals = 16;
//
    event Transfer(address from, address to, uint amount);
    event BalanceSet(address who, uint amount);

    mapping(address => uint) public balances;

    uint public lastTxDate = 0;

    function setBalance(address addr) public payable {
        console.log("we have amount");
        console.log(msg.value);
        balances[addr] = msg.value;
//        emit BalanceSet(msg.sender, msg.value);
    }
//
//    function transferOrig(address to, uint amount) public {
//        uint bal = balances[msg.sender];
//        bal = bal - amount;
//        balances[msg.sender] = bal;
//        balances[to] = balances[to] + amount;
//        emit Transfer(msg.sender, to, amount);
//        lastTxDate = block.timestamp;
//    }
//
    function transfer(address to, uint amount) public returns(uint bal){
        console.log("in transfer");
        console.log(to);
        console.log(amount);
        uint bal = balances[msg.sender];
        bal = bal - amount;
        balances[msg.sender] = bal;
        balances[to] = balances[to] + amount;
        emit Transfer(msg.sender, to, amount);
        lastTxDate = block.timestamp;
        console.log("transfer finished");
    }
//
    function bulkTransfer(address[] memory tos, uint[] memory amounts) public{
//        require(tos.length == amounts.length, "tos and amounts length is not same");
        for(uint i=0;i<tos.length;i++){
            transfer(tos[i], amounts[i]);
        }
    }
//
//    function bulkTransfer2(address[] calldata tos, uint[] calldata amounts) public{
//        require(tos.length == amounts.length, "tos and amounts length is not same");
//        for(uint i=0;i<tos.length;i++){
//            transfer(tos[i], amounts[i]);
//        }
//    }
//
    function changeLastTxDate(uint num) public {
        lastTxDate = num;
    }

//    function adminOnlychangeLastTxDate(uint num) public {
//        lastTxDate = num;
//    }

    function setName(string memory foo) public{
        name = foo;
    }

    function stringInOut(string memory a, address foo) public view returns(string memory b){
        string memory b = a;
        return b;
    }

    function anotherSetName(bytes32 foo) public{
        name = string(abi.encodePacked(foo));
    }

}
