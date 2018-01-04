pragma solidity ^0.4.0;

contract Dummy{
    string word ;
    uint num;
    address owner;
    
    function Dummy(string _word){
        word=_word;
        num=42;
        owner=msg.sender;
    }
    
    event Changed(address a);
    
    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }
    
    function getWord() constant returns(string){
        return word;
    }
    
    function setWord(string w) onlyOwner{
        word=w;
        Changed(msg.sender);
    }
}

