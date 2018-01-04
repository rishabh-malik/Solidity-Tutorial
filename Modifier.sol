pragma solidity ^0.4.0;

contract Modifier{
    string word="Hello World";
    address owner;
    
    function Modifier(){
        owner=msg.sender;
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
    
    function getWord() constant returns(string){
        return word;
    }
    
    function setWord(string newWord) onlyOwner returns(string){
        word=newWord;
        return "You successfully changed the word";
    }
}