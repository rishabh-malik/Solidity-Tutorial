pragma solidity ^0.4.0;

contract Savings{
    
    address owner;
    
    event UpdateStatus(string _msg);
    event UserStatus(string _msg,address owner,uint amount);
    
    function Savings(){
        owner=msg.sender;   
    }
    
    function depositFunds() payable{
        UserStatus("User deposited some money",msg.sender,msg.value);
    }
    
    function kill() onlyOwner{
        suicide(owner);
    }
    
    function getFunds() onlyOwner constant returns(uint){
        return this.balance;
    }
    
    function withDrawFunds(uint amount) onlyOwner{
        if(owner.send(amount)){
            UpdateStatus('User withdraw some money');
        }
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
    
}
    