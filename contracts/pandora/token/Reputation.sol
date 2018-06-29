pragma solidity ^0.4.23;

import "./IReputation.sol";

contract Reputation is IReputation {

    mapping(address => uint256) public values;

    constructor()
    public {
        owner = msg.sender;
    }

    function incrReputation(address account, uint256 amount)
    onlyOwner
    public {
        assert(values[account] + amount >= values[account]);
        values[account] += amount;
    }

    function decrReputation(address account, uint256 amount)
    onlyOwner
    public {
        if (values[account] - amount < values[account]) {
            values[account] -= amount;
        } else {
            values[account] = 0;
        }
    }
}