pragma solidity >=0.6.22 <0.8.0;


contract HashContract{

    mapping(uint => bool) hashes;
    
    
    function addHash (string memory hash_) public {
        uint random = uint(keccak256(abi.encodePacked(hash_)));
        hashes[random]=true;
    }
    function verifyHash (string memory hash_) public returns (bool){
        uint random = uint(keccak256(abi.encodePacked(hash_)));
        if (hashes[random]==true) return true;
        else  return false ;
    }

}
