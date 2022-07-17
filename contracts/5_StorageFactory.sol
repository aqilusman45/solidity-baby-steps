// SPDX-License-Identifier: MIT

// contracts can deploy other contracts as well.
// In this file we will create a storage factory
// that will deploy and interact with SimpleStorage contract
// and deploy.

pragma solidity ^0.8.0;

// this is a storage statement, it is relative path to your
// contract file with its extension.
import "./4_SimpleStorage.sol";

contract StorageFactory {
    // we will need a storage data location to hold instance of
    // simplestorage contract. Its type is SimpleStorage with public
    // access specifier.
    // SimpleStorage public ssInstance;
    // whenever createSimpleStorageContract is called
    // it will replace the existing contract in that variable
    // to fix this we can create ssInstance variable as an array
    // that will allow us to store/deploy multiple contracts.
    SimpleStorage[] public ssIntances;

    function createSimpleStorageContract() public {
        SimpleStorage newSSInstance = new SimpleStorage();
        ssIntances.push(newSSInstance);
    }

    function sfStore(uint256 _contractIndex, int256 _rainPercentage) public {
        // to interact with any contract you need to two things
        // Address of contract
        // ABI ( Application Binary Interface ),
        // it will tell our code how we can interact with contract.

        // in this contract we can access the contract
        // using the array index of ssIntance variable.
        SimpleStorage ssObject = ssIntances[_contractIndex];
        ssObject.storeRainPercentage(_rainPercentage);
    }

    function sfGet(uint256 _contractIndex) public view returns(int256) {
        SimpleStorage ssObject = ssIntances[_contractIndex];
        //return 
        ssObject.getNewNumber();
        // similary
        return ssIntances[_contractIndex].getNewNumber();
    }
}
