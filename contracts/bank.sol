// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Bank {
    mapping(address => uint256) private _balances;
    mapping(address => bool) private  _userExists;

    uint256 public balance = 0;

    function cashIn() public payable  {
        require(checkUserExists(msg.sender), "You do not exist");
        _balances[msg.sender] += msg.value;
    }

    function cashOut(uint256 amount) public payable  {
        require(checkUserExists(msg.sender), "You do not exist");
        require(_balances[msg.sender] >= amount);
        _balances[msg.sender] = _balances[msg.sender] - amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return _balances[msg.sender];
    }

    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function transfer(address payable _to, uint256 amount) public payable  {
        require(amount == msg.value, "Please check your amount!");
        require(checkUserExists(_to));
        require(isEnoughBalance(amount), "You don't have enough balance, Please deposit in more!");
        _to.transfer(msg.value);

    }

    function checkUserExists(address addr) private view returns(bool) {
        return _userExists[addr];
    }

    function isEnoughBalance(uint256 amount) public  view returns(bool) {
        return _balances[msg.sender] >= amount;
    }
}