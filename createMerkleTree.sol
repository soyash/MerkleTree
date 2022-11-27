// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract createMerkleTree {

    bytes32[] public merkleData;

    struct transactions {
        bytes32 
    }

    function createArray(uint x) public {
        merkleData.push(keccak256(abi.encodePacked(x)));
    }

    function isPowerOfTwo(uint x) internal pure returns (bool) {
        if(x == 0){
            return false;
        }
        while(x != 1) {
            if (x % 2 != 0) {
                return false;
            }
            x = x / 2;
        }
        return true;
    }


    // maybe ask this question in ethoverflow about can stuff like this be used to overload evm chain
    function nextPowerOfTwo(uint x) internal pure returns(uint j) {
        uint i = 1;
        while(2**i <= x) {
            j = i+1;
            if (2**(j) > x) {
                return (j);
            }
            i += 1;
        }
    }


    function paddedArray() public {

        uint len = merkleData.length;

        if(!isPowerOfTwo(len)) {
            bytes32 lastElement = merkleData[len-1];
            uint npot = nextPowerOfTwo(len);
            uint padding = 2**npot - len;
            for (uint i = 0; i < padding; i++) {
                merkleData.push(lastElement);
            }
        }
    }
    

    function getTreeDepth(uint) public returns(uint depth) {

    }
}


contract Todos {
    
    uint[] public leafValues = [1,2,3,4,5,6,7,8];
    bytes32[][] public hashValues; // array that contains 4 dynamic bytes32 arrays [[b32],[b32],[b32],[b32]]

    bytes32[] public arr;

    function createArray(uint _size) public {
        bytes32[] memory tempArray = new bytes32[](_size);
        uint count = 0;

        for(uint i=0; i < leafValues.length; i+=2) {
            bytes32 temp = keccak256(abi.encodePacked(leafValues[i], leafValues[i+1]));
            tempArray[count] = temp;
            count++; 
        }

        hashValues.push(tempArray);
    }

    
}