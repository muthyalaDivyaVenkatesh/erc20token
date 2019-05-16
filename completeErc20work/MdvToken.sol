pragma solidity >=0.4.22 <0.6.0;

import './SafeMath.sol';
import './ERC20.sol';


contract MdvToken is ERC20 {
    using SafeMath for uint256;
    
    string public  name = "MdvToken";
    string public  symbol = "$";
    uint  public decimals = 18;
    uint256 public totalsupply = 100;
    mapping   (address => uint256) public balances;
     mapping(uint => uint) incrementing;
     uint public timefor;
     uint present_time;
     uint diffrence;
     uint intial_supply;
     uint first_value;
     uint loot;
     
    // balances[msg.sender];
    address owner;
    
    constructor() public payable{
        owner = msg.sender;
        balances[owner]=  totalsupply;
        present_time = now;
        // we are not using safe math method here because it is a constructor
        intial_supply = (5*totalsupply)/totalsupply;
         balances[owner]=  intial_supply;

    }
    // allowed 
    mapping(address => mapping(address => uint256)) allowance;
    
     event Transfer(  address indexed _from,
        address indexed _to,
        uint256 _value
    );
    // best modifier for altering the code 
    
    
    modifier vesting () {
    if (now< present_time+600) {
        
        diffrence = now- present_time;
         loot = uint(diffrence/30 seconds);
         loot = loot + 1 ;
         intial_supply = loot *(5*totalsupply)/100;
         balances[owner]  =  intial_supply;
    
    }
    _;
}

  // function for totalsupply 
   function totalSupply() public view returns (uint256) {
       return totalsupply;
   }

    // function  for returning the  balanceOf the sender 
    function balanceOf(address _who) public    returns (uint) {
         if (now > present_time+600) {
            balances[_who] = totalsupply;
        }
        return balances[_who];
    }
    
    function anotherbalance(address _to) public view returns(uint balance){
        return balances[_to];
    }

    
      event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    
    // function of transfer from 
    function transfer(address _to , uint _tokens)  public vesting()  returns(bool)  {
      require(balances[msg.sender] >=  _tokens);
      // Next delete the no of tokens from the account
      balances[msg.sender] = balances[msg.sender].sub(_tokens);
      balances[_to] += balances[_to].add(_tokens);
      timefor = block.timestamp;
      // check and transfer 
        emit Transfer(msg.sender, _to, _tokens);
         return true;
        
    }
   //  implimenting transfer from 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balances[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
   
    // function approve 
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit  Approval(msg.sender, _spender, _value);
        return true;
           
       }
       
      
}
     