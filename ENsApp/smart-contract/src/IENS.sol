
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


interface IENS{

    function getEnsAddress(string memory _name) external view returns(address);
    function sendMessage(string memory _text, address _reciever) external;



}