pragma solidity ^0.4.0;

contract PayCheck{
    
    address[] employees=[0x14723a09acff6d2a60dcdf7aa4aff308fddc160c,0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db,0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db,0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db];
    uint totalReceived=0;
    mapping (address=>uint) withDrawAmount;

    function withDraw() canWithdraw{
        uint amountAllocated=totalReceived/employees.length;
        uint amountWithdrawn=withDrawAmount[msg.sender];
        uint amount=amountAllocated - amountWithdrawn;
        withDrawAmount[msg.sender]=amountWithdrawn+amount;
        if(amount>0){
            msg.sender.transfer(amount);
        }
    }

    function PayCheck() payable{
        updateTotal();
    }
    
    function () payable{
        updateTotal();
    }
    
    function updateTotal() internal{
        totalReceived+=msg.value;
    }
    
    modifier canWithdraw(){
        bool contains=false;
        for(uint i=0;i<employees.length;i++){
            if(employees[i]==msg.sender){
                contains=true;
            }
        }
        require(contains);
        _;
    }
}