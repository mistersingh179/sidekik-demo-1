// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyContract {
    string public name = "bar";
    uint public expiration;
    uint public countOfFriends;
    address[] public friends;
    struct Friend {
        string name;
        uint age;
        uint etherLimit;
    }

    IERC20 Usdc = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    function setName(string memory newName) public {
//        Usdc.transferFrom(msg.sender, address(this), 1);
        require(expiration < block.timestamp, "you cant change till expiration passes");
        name = newName;
        expiration = block.timestamp + 7 days;
    }

    function empty() public {

    }

    function timestamp() public view returns (uint timestmap){
        return block.timestamp;
    }

    function submitFriends(address[] memory newFriends) public {
//        countOfFriends = newFriends.length;
        for(uint i=0;i<newFriends.length;i++){
            friends.push(newFriends[i]);
        }
        countOfFriends = friends.length;
    }

    function submitInfoOfFriend(address addr, Friend memory info) public{

    }




}