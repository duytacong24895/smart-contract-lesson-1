// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Bank {
    mapping(address => uint256) private _ledger;
    struct customer {
        address addr;
        string name;
    }
    mapping(address => customer) private _customers;

    uint256 public balance = 0;

    function cashIn() public  payable  {
        
    }

    function newCustomer(string memory name) public  {
        address sender = msg.sender;
        require(_customers[msg.sender].addr == address(0), "You are already a customer.");
        _customers[sender] = customer(msg.sender, name);
    }

    function checkCustomer() private view returns(bool isInit) {
        if(_customers[msg.sender].addr == address(0)) {
            return false;
        }
        return true;
    }
    
    // function deposit() public payable {
    //     address sender = msg.sender;
    //     require(_ledger[sender] == 0, "You are already depositing.");
    //     _ledger[sender] = msg.value;
    //     balance += msg.value;
    // }
}