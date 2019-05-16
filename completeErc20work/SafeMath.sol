pragma solidity >=0.4.22 <0.6.0;

library SafeMath {
    
    function mul(uint256 a, uint256 b) internal pure returns(uint) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a*b;
        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns(uint256) {
        //  solidity for checking  0  division error
        require(b>0,"SafeMatch : division by zero");
        uint c = a/b;
        return c;
    }
    
    function sub(uint256 a,uint256 b) internal pure returns (uint256){
        // now check for subraction 
        require(b<=a,"SafeMatch b should be grater than a");
        uint c = a-b;
        return c;
        }
    function add(uint256 a,uint256 b) internal pure returns(uint256) {
        uint256 c = a+b; 
        return c;
     }
     function mod(uint a,uint b) internal pure returns(uint256) {
         uint256 c = a%b;
         return c;
         
     }
    
        
    }
