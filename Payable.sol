pragma solidity ^0.4.0;

contract PayableContract{
    function receiveFunds() payable{
        
    }
    
    function getBalance() constant returns(uint){
        return this.balance;
    }
}