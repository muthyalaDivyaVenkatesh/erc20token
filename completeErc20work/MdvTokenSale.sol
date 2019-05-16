pragma solidity >=0.4.22 <0.6.0;

import './MdvToken.sol';
import './SafeMath.sol';


contract MdvTokenSale {
    
    using SafeMath for uint;
    address admin;
    MdvToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;
    uint256 public moneypayed;
    uint256 public balanceofuser;
    
    address payable _wallet;
    
    event Sell(address _buyer, uint256 _amount);
    
    constructor(MdvToken _tokenContract, uint256 _tokenPrice, address payable wallet) public payable
    {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        _wallet = wallet;
    }
    
    
    function() external payable {
        buyTokens(msg.sender);
    }
    
    
    
    function buyTokens(address beni) public payable  {
        require (msg.value != 0," Zero wei send ");
        
        uint weiAmount = msg.value;
        
        uint tokens = tokenPrice.mul(weiAmount);
        tokenContract.transferFrom(_wallet,beni,tokens);
        
        // emit Sell(beni,tokens);
        
    }
    
    
    function balanceofbuyer(address _owner) public   returns(uint){
        return tokenContract.balanceOf(_owner);
    }
    
   
    }
