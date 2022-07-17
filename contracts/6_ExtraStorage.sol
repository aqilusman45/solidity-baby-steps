// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './4_SimpleStorage.sol';

// Inhertance and Overriding

contract ExtraStorage is SimpleStorage {
    // function polymorphism
    // method overriding.
    // virtual overriding.
    // note that to override a function you need to add
    // virtual keyword in the function of the parent contract.
    function storeRainPercentage(int256 _forecast) public override {
        rainPercentage = _forecast + 1;
    }
}