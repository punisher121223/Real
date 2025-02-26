// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TetherFlash {
    string public name = "Tether Flash";  // اسم توکن
    string public symbol = "TFLASH";      // نماد توکن
    uint8 public decimals = 6;            // تعداد اعشار
    uint256 public totalSupply;           // کل عرضه

    mapping(address => uint256) public balanceOf;  // موجودی هر آدرس

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** decimals;  // عرضه اولیه
        balanceOf[msg.sender] = totalSupply;           // توکن‌ها به سازنده می‌ره
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Not enough balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        return true;
    }
}
