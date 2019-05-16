pragma solidity >=0.4.22 <0.6.0;

import './SafeMath.sol';
import './MdvToken.sol';

contract CrowdFundingdetails is ERC20 {
     using SafeMath for uint256;
     
     // mimimum amount  of funds to be raised while crowdsale is running 
     uint256 private _goal;
     
     // Refund escrow used to hold funds while crowd sale is running 
     
     
     //use Escrow events  
     event Deposited(address indexed payee, uint256 weiAmount);
     event Withdraw(address indexed payee, uint256 weiAmount);
     
     //use mapping to store all the deposits 
     mapping(address =>uint256 ) private _deposits;
     
     // function deposit  payee the destination of the funds 
     function deposit(address payee) public  payable {
         uint256 amount  = msg.value;
         _deposits[payee] = _deposits[payee].add(amount);
         
         emit Deposited(payee,amount);
     }
     
     
     // functio withdraw  here payaee menas whose funds will be withdrawn
     function withdraw(address payable payee) public {
         uint256 payment = _deposits[payee];
         // Now payament will have the balance of the payee 
         _deposits[msg.sender]  = 0;
         
         payee.transfer(payment);
         
         // now emit the event 
         emit  Withdraw(payee,payment);
         
         
     } 
     
}
