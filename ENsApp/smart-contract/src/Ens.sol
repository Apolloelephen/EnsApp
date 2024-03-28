// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ENS {

    struct ensDomain{
        address owner;
        bool isAvailable;
    }

    mapping (string => ensDomain) byteToUser;

    mapping ( address => string ) userToBytes;

    ensDomain[] public ensArray;



   function register(string memory _name) public{

    if (byteToUser[_name].isAvailable == true){
        revert("name not available");
    }
    require(address(0)!= msg.sender, 'invalid address');

    ensDomain memory ensStore;
    ensStore.owner = msg.sender;
    ensStore.isAvailable == false;

    byteToUser[_name].owner = msg.sender;
    userToBytes[msg.sender] = _name;

    ensArray.push(ensStore);
}


    function getEnsAddress(string memory _name) public view returns(address) {
        return byteToUser[_name].owner;
    }

    function getEnsName( address owner) public view returns(string memory) {
        return userToBytes[owner];
    }
 
}