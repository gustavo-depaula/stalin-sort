// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "remix_tests.sol";
import "hardhat/console.sol";
import "./StalinSort.sol";

contract StalinSortTest {
    
    StalinSort stalinSortToTest;
    
    function beforeAll () public {
        stalinSortToTest = new StalinSort();
    }
    
    function checkEmptyArray() public {
        console.log("Running checkEmptyArray");
        uint[] memory arr = new uint[](0);
        uint[] memory result = stalinSortToTest.stalinSort(arr);
        Assert.equal(result.length, uint(0), "empty array should return empty array");
    }
    
    function checkSingleElement() public {
        console.log("Running checkSingleElement");
        uint[] memory arr = new uint[](1);
        arr[0] = 42;
        uint[] memory result = stalinSortToTest.stalinSort(arr);
        Assert.equal(result.length, uint(1), "single element array should keep its element");
        Assert.equal(result[0], uint(42), "single element should remain unchanged");
    }
    
    function checkBasicSort() public {
        console.log("Running checkBasicSort");
        uint[] memory arr = new uint[](5);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 4;
        arr[3] = 3;
        arr[4] = 5;
        
        uint[] memory result = stalinSortToTest.stalinSort(arr);
        Assert.equal(result.length, uint(4), "should remove one out-of-order element");
        Assert.equal(result[0], uint(1), "first element should be 1");
        Assert.equal(result[1], uint(2), "second element should be 2");
        Assert.equal(result[2], uint(4), "third element should be 4");
        Assert.equal(result[3], uint(5), "fourth element should be 5");
    }
    
    function checkAlreadySorted() public {
        console.log("Running checkAlreadySorted");
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        
        uint[] memory result = stalinSortToTest.stalinSort(arr);
        Assert.equal(result.length, uint(3), "sorted array should keep all elements");
        for(uint i = 0; i < arr.length; i++) {
            Assert.equal(result[i], arr[i], "elements should remain unchanged");
        }
    }
    
    function checkTotallyUnsorted() public {
        console.log("Running checkTotallyUnsorted");
        uint[] memory arr = new uint[](5);
        arr[0] = 5;
        arr[1] = 4;
        arr[2] = 3;
        arr[3] = 2;
        arr[4] = 1;
        
        uint[] memory result = stalinSortToTest.stalinSort(arr);
        Assert.equal(result.length, uint(1), "should keep only first element");
        Assert.equal(result[0], uint(5), "should keep first element value");
    }
    
    function checkReturnValue() public view returns (bool) {
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        uint[] memory result = stalinSortToTest.stalinSort(arr);
        return result.length == 3;
    }
}
