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

    // Mappings
    mapping(string => uint256) public nameToFavoriteNumber;

    // functions in sol.
    function storeRainPercentage(int256 _forecast) public {
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
    function getNewNumber() public view returns (int256) {
        // example of view function
        // newNumber variable is not accessible in this
        // function as it is outside its scope.
        return rainPercentage;
    }

    // types of functions that dont spend gas since they dont perform any modifications in the contract.
    // until and unless they are called inside a functions that consumes gas.

    // view function -> these functions just read a state in the contract.
    // pure function -> these functions returns same output for same input and have no side effect.
    function addNumber(int256 _a, int256 _b) public pure returns (int256) {
        return _a + _b;
    }

    // structs, like objects in javascript, the order of fields in struct is numbered.
    // for example, favoriteNumber is at index 0 and name is at index 1
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 2, name: "Usman"});

    // arrays, below is a dynamic array,
    // it does not have a size specified in the square bracket like [2].
    People[] public people;

    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson1 = People({
            favoriteNumber: _favoriteNumber,
            name: _name
        });
        // we can also create an object by providing
        // arguments based on position, e.g, favoriteNumber is
        // first param for People struct and name is the seconde.
        People memory newPerson2 = People(_favoriteNumber, _name);
        // push is an array method that allows us to insert element into an array
        people.push(newPerson1);
        people.push(newPerson2);
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // there are 6 places in solidity where we can store data.
    // - Stack
    // - Memory -> Temporary existence only during the transaction that the functions call
    //   memory variable can be reassigned in the function call.
    // - Calldata -> Temporary existence only during the transaction that the functions call,
    //   calldata cannot be reassigned in the function.
    // - Code
    // - Logs
    // - Storage 

    // example with memory
    function run (string memory _miles) public pure returns (string memory) {
        _miles = "3 miles"; // can be reassinged.
        return _miles;
    }

    // example with calldata
    function hide(string calldata place) public pure returns (string memory) {
        // place = "closet"; cannot be reassigned will throw error.
        return place;
    }

    // solidy only requires data location for array, struct, and mapping types.
    // now you may ask why give data location such as memory or calldata for strings.
    // for that strings are complex and are basically arrays of bytes.
    // so that is why this wont work func (uint256 memory _newInt) {}

    // we cant use storage keyword instead of memory or calldata
    // as storage keyword is only used for permanent variables.
}
