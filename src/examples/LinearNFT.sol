// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {SafeTransferLib} from "solmate/utils/SafeTransferLib.sol";

import {toDaysWadUnsafe} from "solmate/utils/SignedWadMath.sol";

import {LinearSEA} from "src/LinearSEA.sol";

contract LinearNFT is ERC721, LinearSEA {
    uint256 public totalSold;
    uint256 public immutable startTime = block.timestamp;

    constructor() ERC721("NFT", "LINEAR") LinearSEA(69.42e18, 0.31e18, 2e18) {}

    function bid(uint256 amount) external payable {}

    function tokenURI(uint256) public pure override returns (string memory) {
        return "";
    }
}
