// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Chat {
    
    struct Message {
        uint256 id;
        string text;
        address sender;
        address reciever;
        bool isDelivered;
    }

    address public ensAddress;
    uint256 MSGid;

    mapping(address => mapping(address => Message)) public messages;

    constructor(address _ensAddress) {
        ensAddress = _ensAddress;
    }

    Message[] public messageArray;

    function sendMessage(string memory _text, address _reciever) public {

        uint256 Txtid = MSGid += 1;
        require(msg.sender != address(0), "invalid address");

        Message memory userMSG = messages[msg.sender][_reciever];
        userMSG.text = _text;
        userMSG.sender = msg.sender;
        userMSG.reciever = _reciever;
        userMSG.id = Txtid;
        userMSG.isDelivered = false;

        messageArray.push(userMSG);
    }

    function getMessage(address _receiver) public view returns (string memory) {
        return messages[msg.sender][_receiver].text;
    }
}