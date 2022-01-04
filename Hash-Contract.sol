pragma solidity >=0.6.22 <0.8.0;

contract Hash-Contract {

function addHash(string data, string metaData) public onlyPatient
{ 
  if (data.isValue) 
  {
       bytes memory _bData = bytes(data);
       bytes memory _bMetaData = bytes(metaData);
       string memory storeData = new string(_bdata.length + _bmetadata.length);
      
       registry[hash]= sha256(abi.encodePacked(storeData));
    }
   else
         revert()
}
   
   
function verifyHash(string queryData, string metaData) public view returns(bool)
{ 
    bytes memory _bData = bytes(queryData);
   bytes memory _bMetaData = bytes(metaData);
   string memory storeData = new string(_bdata.length + _bmetadata.length);
       
    if(registry[hash]= sha256(abi.encodePacked(storeData)))
    {
       return true;
  }
  else
       return false;
 }

}