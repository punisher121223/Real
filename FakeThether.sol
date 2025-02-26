pragma solidity ^0.5.0;

contract FakeTether {
    string public name = "Tether";
    string public symbol = "USDT";
    uint8 public decimals = 6;
    uint256 public totalSupply = 1000000 * (10 ** 6); // 1 میلیون توکن
    mapping(address => uint256) public balanceOf;

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Not enough tokens");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }

    // تابع برای دریافت TRX و تبدیل به توکن تقلبی (برای تست)
    function deposit() public payable {
        uint256 amount = msg.value; // مقدار TRX ارسالی
        balanceOf[msg.sender] += amount * 100; // مثلاً هر TRX = 100 توکن
    }

    // تابع برای برداشت TRX (برای تست)
    function withdraw(uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "Not enough tokens");
        balanceOf[msg.sender] -= _value;
        msg.sender.transfer(_value / 100); // هر 100 توکن = 1 TRX
    }
}
