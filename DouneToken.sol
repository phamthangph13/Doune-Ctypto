// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract  DouneToken{
    
    mapping(address => uint) public balances;
    
    mapping(address => mapping(address => uint)) public allowance;

    
    uint public totalSupply = 13000000;
    string public name = "Doune";
    string public symbol = "DNE";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    // run when the contract is deployed
    constructor(){
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address owner) public view returns(uint){
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(msg.sender) >= value, 'Insufficient funds');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, 'Insufficient funds');
        require(allowance[from][msg.sender] >= value, 'Insufficient funds');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    
    function approve(address spender, uint value) public returns(bool){
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}


