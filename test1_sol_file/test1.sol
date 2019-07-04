pragma solidity ^0.5.2;

contract MyToken {
    mapping (address => uint256) public balanceOf; 

    constructor( uint256 initialSupply) public {
        balanceOf[msg.sender] = initialSupply;  
    }

    function transfer(address to, uint256 value) public returns (bool success){ 
        balanceOf[msg.sender] -=value;
	    balanceOf[to]+=value;
	    return true;
    }
}

