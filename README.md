# TechPay wTPC DeFi module

The repository implements wrapped TPC tokens used to normalize
DeFi tokens use with the native tokens. Native TPCs can be freely
wrapped into the ERC20 wTPC and unwrapped back to TPC without a fee.
The only cost involved is the transaction fee of the exchange contract
call.

Please note we use
[OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
library version 2.5 along with the Solidity 0.5 and truffle
to conform with the EVM implemented in the Photon block chain.
Consult the [Truffle](https://www.trufflesuite.com)
documents to find out how to build and deploy
the smart contract implemented here.

In general, all you should need to do is to call `truffle build`
to get the deployable contract code and ABI inside `build/` folder.
