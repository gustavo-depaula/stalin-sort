// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StalinSort {
    function countValidElements(uint[] memory arr) internal pure returns (uint) {
        if (arr.length == 0) return 0;
        uint count = 1;
        uint lastValid = arr[0];
        
        for (uint i = 1; i < arr.length; i++) {
            if (arr[i] >= lastValid) {
                count++;
                lastValid = arr[i];
            }
        }
        return count;
    }
    
    function stalinSort(uint[] memory arr) public pure returns (uint[] memory) {
        if (arr.length <= 1) return arr;
        
        uint validCount = countValidElements(arr);
        uint[] memory result = new uint[](validCount);
        result[0] = arr[0];
        uint lastValid = arr[0];
        uint resultIndex = 1;
        for (uint i = 1; i < arr.length; i++) {
            if (arr[i] >= lastValid) {
                result[resultIndex] = arr[i];
                lastValid = arr[i];
                resultIndex++;
            }
        }
        
        return result;
    }
}
