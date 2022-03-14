pragma solidity >=0.6.22 <0.8.0;

contract DSContract {

address payable public patient;
mapping (address => mapping (string => subjectsAccessRights)) accessList;

struct subjectsAccessRights { //The access rights for data users. It is created per each operation
string operation; //like read, write
string permission; //like allowed, denied
uint grantTime; //the time that the permission is granted to the user
bool isValue; //for duplicate check
 }

function addConsumer(address _consumer, string memory _operation, string memory _permission, uint _grantTime) public 
{ 
    if (accessList[_consumer][_operation].isValue) 
        revert(); //the data consumer and right already exists
    else { 
        accessList[_consumer][_operation].operation = _operation; 
        accessList[_consumer][_operation].permission = _permission; 
        accessList[_consumer][_operation].grantTime = _grantTime;
        } 
} 


function deleteConsumer(address _consumer, string memory _operation ) public 
{ 
    if(accessList[_consumer][_operation].isValue) 
        delete accessList[_consumer][_operation];
    else 
        revert(); //if the data consumer doesn't exist, revert 
} 


function getAccessRight(address _consumer, string memory _operation) public view returns (string memory _permission)
{ 
    if (accessList[_consumer][_operation].isValue)
        {
        _permission = accessList[_consumer][_operation].permission;
        } 
    else 
        revert(); //if the data consumer does not exist, revert. 
 return _permission;
}  

function updateAccessRights(address _consumer, string memory _operation,string memory _permission) public  
{ 
    if (accessList[_consumer][_operation].isValue)
    { 
         accessList[_consumer][_operation].permission = _permission; 
    } 
    else
        revert(); //if the data consumer doesn't exist, revert 
}

 function deleteDS() public 
 { 
    selfdestruct(patient); 
 }
 

}
