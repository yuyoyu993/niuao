// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public minter;

    event MinterChanged(address indexed from, address to);

    constructor() ERC20("MyToken", "MTK") {
        minter = msg.sender;
    }

    function passMinterRole(address dBank) public returns (bool) {
        require(msg.sender == minter, "Error, only owner can change pass minter role");
        minter = dBank;

        emit MinterChanged(msg.sender, dBank);
        return true;
    }

    function mint(address account, uint256 amount) public {
        require(msg.sender == minter, "Error, msg.sender does not have minter role");
        _mint(account, amount);
    }
}
