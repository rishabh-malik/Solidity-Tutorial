pragma solidity ^0.4.0;

//Casino game coinflip in which users can bet

contract CoinFlip{
    address owner;
    uint payPercentage=190;
    
    event Status(string msg,address user,uint amount);
    
    function CoinFlip() payable{
        owner=msg.sender;
    }
    
    function FlipCoin() payable{
        if((block.timestamp%2)==0){
            if(this.balance<((msg.value*payPercentage)/100)){
                Status("Congratulations we dont have that much money",msg.sender,this.balance);
                msg.sender.transfer(this.balance);
            }else{
                Status("Congratulations",msg.sender,(msg.value*payPercentage)/100);
                msg.sender.transfer((msg.value*payPercentage)/100);
            }
        }else{
            Status("sorry you lose,try again",msg.sender,msg.value);
        }
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
    
    function kill() onlyOwner{
        Status("Contract killed",msg.sender,this.balance);
        suicide(owner);
    }
    
}