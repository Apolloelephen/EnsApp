// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ENS {

    struct ensDomain{
        address owner;
        bool isAvailable;
    }

    mapping (bytes32 => ensDomain) byteToUser;

    mapping ( address => bytes32 ) userToBytes;

    ensDomain[] public ensArray;


   // register,ownersip, renew,resolve,

   function register(bytes32 _name) public{
    bytes32 _nameHash = keccak256(abi.encodePacked(_name));
    if (byteToUser[_nameHash].isAvailable == true){
        revert("name not available");
    }
    require(address(0)!= msg.sender, 'invalid address');

    ensDomain memory ensStore;
    ensStore.owner = msg.sender;
    ensStore.isAvailable == false;

    byteToUser[_nameHash].owner = msg.sender;
    userToBytes[msg.sender] = _nameHash;

    ensArray.push(ensStore);
}


    function getEnsAddress(bytes32 _name) public view returns(address) {
        bytes32 _nameHash = keccak256(abi.encodePacked(_name));
        return byteToUser[_nameHash].owner;
    }

    function getEnsName( address owner) public view returns(bytes32) {
        return userToBytes[owner];
    }
 
}