// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./erc20/ERC20.sol";

contract Lockup is ERC20 {
    // 지갑 잠금 Timestamp에 대한 매핑
    mapping(address => uint) public lockTimePerAccount;

    // 지갑 Lock 이벤트
    event Freeze(address account, uint lockTime);

    constructor() ERC20("TestToken", "TT") {
        super._mint(_msgSender(), 10000 ether);
    }

    // 지갑 잠금
    function freezeAccount(address account,  uint lockTime) external onlyOwner{
        // 지갑에 대한 잠금 설정
        lockTimePerAccount[account] = lockTime;
        emit Freeze(account, lockTime);
    }

    // 지갑 잠금 해제
    function unFreezeAccount(address account) external onlyOwner{
        // 지갑에 대한 잠금 설정
        lockTimePerAccount[account] = 0;
        emit Freeze(account, block.timestamp);
    }

    // ERC20 Contract의 함수를 Override하여 Transfer전에 From 혹은 To Address가 잠금 상태인지 확인
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 value
    ) internal virtual override {
        uint lockTimeFrom = lockTimePerAccount[from];
        uint lockTimeTo = lockTimePerAccount[to];
        require(block.timestamp > lockTimeFrom, "Test : Lock state From Address");
        require(block.timestamp > lockTimeTo, "Test : Lock state To Address");
        super._beforeTokenTransfer(from, to, value);
    }
}
