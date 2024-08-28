// SPDX-License-Identifier: MIT;
pragma solidity >=0.7.0 <0.9.0;

contract Arrays{
    struct Item{
        string name;
        uint256 id;
        bool verify;
     }
     
    Item[] public students;

    function create(string memory _name, uint256 _id) public {
        students.push(Item(_name, _id, true));
    }

    function find(uint256 id) internal view returns (uint256){
        for(uint256 i = 0; i < students.length; i++){
            if(students[i].id == id){
                return i;
            }
        }
        revert('does not exist');
    }

    function read() public view returns (Item[] memory) {
        return students;
    }

    function update(uint256 id) public {
        uint256 i = find(id);
        students[i].verify = !students[i].verify; // Toggle the verify field.
    } 
}