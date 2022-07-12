// SPDX-License-Identifier: MIT
// declare your license ^

pragma solidity >=0.8.7; // declare the version of solidity you want to use.

// comments are same as you write comments in other langauges.

// solidity version decleration practices:
// you give an exact version like 0.8.7.
// use stable version but you should be comfortable with all versions.
// use caret to indicate that this contract compatible with newer versions e.g ^0.8.7
// use versions in a specific range e.g >=0.8.7 <0.9.0

contract SimpleStorage {
    // data types
    bool isActive; // default value is null or undefined if not initialized
    uint8 favoriteNumber = 100; // unsigned integer only positive number with memory size
    string myName = "usman";
    int256 favoriteNumberPositive = -33; // signed integer, can be -ve or +ve.
    bytes32 myPetName = "tom"; // similar to string but can also be converted into byte object like 0x1039212312werewr1233
    int256 rainPercentage; // if not initialized it defaults to zero.

    // functions in sol.
    function getRainPercentage(int256 _forecast) public {
        rainPercentage = _forecast;
        // execution of the smart contract requires gas
        // the amount of gas required depends on the computation power consumed.
        // if we add more computation e.g add a number. the gas will increase hence increasing the execution cost.
        rainPercentage = rainPercentage + 1;
        // uint newNumber = 3; // this variable is in the scope of getRainPercentage

        // if we call addNumber in this scope it will consume gas.
        addNumber(3, 4);
    }

    // scope in sol.
    function getNewNumber() public view returns (int256) { // example of view function
        // newNumber variable is not accessible in this
        // function as it is outside its scope.
        return rainPercentage;
    }

    // types of functions that dont spend gas since they dont perform any modifications in the contract.
    // until and unless they are called inside a functions that consumes gas.

    // view function -> these functions just read a state in the contract.
    // pure function -> these functions returns same output for same input and have no side effect.
    function addNumber(int _a, int _b) public pure returns (int) {
        return _a + _b;
    }
}
