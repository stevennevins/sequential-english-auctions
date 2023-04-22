// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {MaxOrderedHeap} from "src/lib/MaxOrderedHeap.sol";

abstract contract SEA {
    using MaxOrderedHeap for MaxOrderedHeap.HeapArray;

    uint256 public immutable reservePrice;
    uint256 public immutable minBidIncrease;
    uint256 public immutable maxSortedBidders = 1_000;

    MaxOrderedHeap.HeapArray internal heap;

    constructor(uint256 _reservePrice, uint256 _minBidIncrease) {
        reservePrice = _reservePrice;
        minBidIncrease = _minBidIncrease;
    }

    function _enterHeap(
        address who,
        uint8 amount,
        uint96 price
    ) internal {
        uint256 index = heap.indexOf[who];
        MaxOrderedHeap.Account memory account = heap.accounts[index];
        uint96 oldValue = account.value;
        heap.update(who, oldValue, price, maxSortedBidders);
    }

    function _leaveHeap(address who) internal {
        uint256 index = heap.indexOf[who];
        MaxOrderedHeap.Account memory account = heap.accounts[index];
        uint96 oldValue = account.value;
        heap.update(who, oldValue, 0, maxSortedBidders);
    }

    function getTargetSaleTime(int256 sold)
        public
        view
        virtual
        returns (int256);
}
