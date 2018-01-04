pragma solidity ^0.4.0;

contract Function{
    string public text='';
    int noOfchanges=0;
    
    function changeToHello(){
        noOfchanges+=1;
        text='Hello';
    }
    
    function callOtherFunction(){
        changeToHello();
    }
}