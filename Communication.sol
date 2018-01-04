pragma solidity ^0.4.0;

contract CallerContract{
    CalledContract toBeCalled= CalledContract(0xde6a66562c299052b1cfd24abc1dc639d429e1d6);
    function getNum() constant returns(uint){
        return toBeCalled.getNum();
    }
}

contract CalledContract{
    uint number=200;
    function getNum() constant returns(uint){
        return number;
    }
}