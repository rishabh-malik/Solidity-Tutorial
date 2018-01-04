pragma solidity ^0.4.0;

contract Seminar{
    
    struct Person{
        string name;
        uint age;
        bool active;
    }
    
    uint256 fee;
    // 20% is lost if the user cancels to attend the seminar
    uint loss=80;

    mapping(address=>Person) public attendants;
    
    function Registration(string _name,uint _age) payable{
        if(msg.value==fee){
            attendants[msg.sender]=Person({
                name:_name,
                age:_age,
                active:true
            });
        }else{
            throw;
        }
    }
    
    function setRegistrationFee(uint256 _fee){
        fee=_fee;
    }
    
    function cancelRegistration(){
        attendants[msg.sender].active=false;
        msg.sender.transfer((fee*80)/100);
    }
}