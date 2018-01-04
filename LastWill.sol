pragma solidity ^0.4.0;

//checks if father is alive or dead
//if dead then distributes the money to its sons equally

contract LastWill{
    
    address owner;
    uint256 public lastTouch;
    address[] public childs;
    event Status(string msg,address user,uint256 time);
    
    function LastWill() payable{
        owner=msg.sender;
        lastTouch=block.timestamp;
        Status("Last Will created",msg.sender,block.timestamp);
    }
    
    function depositFunds() payable{
        Status("Funds deposited",msg.sender,block.timestamp);
    }
    
    function stillAlive() onlyOwner{
        lastTouch=block.timestamp;
        Status("I am still Alive",msg.sender,block.timestamp);
    }
    
    function isDead(){
        Status('Someone is checking if dead or not',msg.sender,block.timestamp);
        if(block.timestamp>(lastTouch+120)){
          giveMoneyToChild();  
        }else{
            Status("I am still Alive",msg.sender,block.timestamp);
        }
    }
    
    function giveMoneyToChild(){
        Status("I am dead take my money",msg.sender,block.timestamp);
        uint amountPerChild=this.balance/childs.length;
        for(uint i=0;i<childs.length;i++){
            childs[i].transfer(amountPerChild);
        }
    }
    
    function addChild(address childAddress) onlyOwner{
        Status("Child Added",childAddress,block.timestamp);
        childs.push(childAddress);
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
}