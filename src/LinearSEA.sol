// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {SEA} from "src/SEA.sol";
import {unsafeWadDiv} from "solmate/utils/SignedWadMath.sol";

abstract contract LinearSEA is SEA {
    int256 internal immutable perTimeUnit;

    constructor(
        uint256 _reservePrice,
        uint256 _minBidIncrease,
        int256 _perTimeUnit
    ) SEA(_reservePrice, _minBidIncrease) {
        perTimeUnit = _perTimeUnit;
    }

    function getTargetSaleTime(int256 sold) public view virtual override returns (int256) {
        return unsafeWadDiv(sold, perTimeUnit);
    }
}
