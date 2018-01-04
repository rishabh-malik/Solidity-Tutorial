pragma solidity ^0.4.0;

contract Mortal{
    address owner;
    
    function Mortal(){
        owner=msg.sender;
    }
    
    function kill(){
        suicide(owner);
    }
}

contract User is Mortal{
    string public name;
    
    function getUser(string _name){
        name=_name;
        
    } 
}