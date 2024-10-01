// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract coin{

    address public minter;

    mapping (address=>uint) public balances;

    // events allow light clients to react on changes efficiently 
    event sent(address from, address to,uint amount);

    // create a construct whose code is run only when the contract is created.
    function coins()public {
        minter=msg.sender;
    }
    function mint(address receiver, uint amount) public {
        if(msg.sender!=minter) return ;
        balances[receiver]+=amount;
    }
    function send (address receiver,uint amount) public {
        if (balances[msg.sender]<amount) return;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit sent(msg.sender,receiver,amount);
    }
}
