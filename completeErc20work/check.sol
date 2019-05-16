pragma solidity >=0.4.22 <0.6.0;

import './MdvToken.sol';

contract check {
     MdvToken public tokenContract;
    // struct for storing all the address and amount sending 
    struct  user {
        address addr;
        uint amount;
    }
    
    // write another mappo 
    
    mapping (uint => user) get_userdetails;
    
    // mapping 
    
    mapping(address => uint ) serch_forid;
    
    
    // value to increment 
    
    uint count;
    
    // declare a struct 
    
     struct a {
       address addr;
        uint amount;
    }
    
    
    uint value_toserch;
    
    constructor ()  public {
        count = 0;
    }
    
    function buy_token(address _address , uint _value)  public payable {
        
        // we will send the address details 
        get_userdetails[count].addr = msg.sender;
        get_userdetails[count].amount = _value;
        
          // now throgh the addess with count varable 
         serch_forid[msg.sender] = count;
         
        // now increment the count value 
        count +=1;
        // now get the value and  count 
        tokenContract.transfer(_address,_value);
        
    }
    
    function revert_balance (address _adminaddress) public   {
        value_toserch = serch_forid [msg.sender];
        
        
         address user_addresstorevert = get_userdetails[value_toserch].addr;
         uint user_valuetorevert  =  get_userdetails[value_toserch].amount;
        
        
        tokenContract.transfer(user_addresstorevert,user_valuetorevert);
        // user_addresstorevert.transfer(user_valuetorevert);
        
        count -=1;
        
        
    }
        
    }
    
    