pragma solidity ^0.4.0;

contract UserProtection{
    string word="Hello World";
    address owner;
    
    function UserProtection(){
        owner=msg.sender;
    }
    
    function getWord() constant returns(string){
        return word;
    }
    
    function setWord(string newWord) returns(string){
        if(owner!=msg.sender){
            return "You cant change";
        }
        word=newWord;
        return "You successfully changed the word";
    }
}