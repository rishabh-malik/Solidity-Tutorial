pragma solidity ^0.4.0;

contract Calculator{
    Math math=new Math();
    
    function addTwoAndFour() constant returns(int){
        return math.add(2,4);
    }
}

contract Math{
    function add(int a,int b) returns(int){
        return a+b ;
    }
}