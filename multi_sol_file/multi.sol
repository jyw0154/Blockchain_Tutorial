pragma solidity ^0.5.2;

contract MyToken {
  mapping (address => uint256) public balanceOf;

  address gatekeeper;
  bytes32 public pendingTX;

  constructor( uint256 initialSupply, address keeper) public {
    balanceOf[msg.sender] = initialSupply;
    gatekeeper=keeper ;
    }

  event Transfer( address from , address to, uint256 value);

  function transfer(address _to, uint256 _value) public returns (bool success) {
    address _from=msg.sender;
    pendingTX=keccak256(abi.encodePacked( _from, _to, _value) );
    emit Transfer(_from, _to, _value);
    return true;
    }

  function approve( address from, address to, uint256 value) public returns (bool success) {
    require (msg.sender==gatekeeper, "Not gatekeeper") ;
    require ( pendingTX ==  keccak256( abi.encodePacked(from, to, value) )) ;
    balanceOf[from] -=value;
    balanceOf[to]+=value;
    pendingTX=bytes32(0);
    return true;
  }
}

