---
layout: post
title:  "Electronic bills of exchange on blockchain"
date:   2019-06-10 21:00:00 +0200
categories: smartcontracts ethereum dapps
---

[Cryptonomica](https://cryptonomica.net) launched a decentralized application ([dApp](https://ethereum.stackexchange.com/questions/383/what-is-a-dapp)) 
that makes possible to create and to transfer electronic bills of exchange on the [Ethereum](https://ethereum.org) blockchain:

[cryptonomica.net/bills-of-exchange](https://cryptonomica.net/bills-of-exchange/)

Electronic bills of exchange can be created as smart contracts implementing requirements of an "order in writing" 
as defined in [U.K. Bills of Exchange Act 1882](http://www.legislation.gov.uk/ukpga/Vict/45-46/61/contents) 
or of a "draft" as defined in [U.S. Uniform Commercial Code](https://www.law.cornell.edu/ucc/3/3-104).

Bills of exchange smart contracts are created by the "Bills of Exchange Factory" smart contract. 
Every new created smart contract with bills of exchange get its number, Ethereum address and code automatically 
verified on [etherscan.io](https://etherscan.io)

Bills of exchange are created as tokens ([ERC20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md) 
in smart contract, where every token is a bill of exchange in blank - payable to bearer (bearer is the owner 
of the Ethereum address witch holds the tokens, or the person he/she represents), but "not to order" - that means 
no endorsement is possible and the token holder can only transfer the token (bill of exchange in blank) itself.

To draw or to accept bills of exchange a person has to use Ethereum address verified on Cryptonomica.net, 
and has to sign an arbitration agreement that makes possible to make legal claims on payments on bills and to 
resolve disputes in our [online arbitration tribunal](https://cryptonomica.net/#!/arbitration)  

See more on our approach to private law in 
[Cryptonomica: ex aequo et bono and new lex mercatoria](https://medium.com/cryptonomica/cryptonomica-ex-aequo-et-bono-and-new-lex-mercatoria-72eef36a2cd5).

See also a page on the Cryptonomica wiki about our [electronic bills of exchange](https://github.com/Cryptonomica/cryptonomica/wiki/electronic-bills-of-exchange) 
and our [pitch deck](http://bit.ly/BoE-pitch-deck)

Cryptonomica bills of exchange dApp: 

[![Cryptonomica bills of exchange dApp](/images/2019-06-10_21-20.cryptonomica.bills.of.exchange.png)](https://cryptonomica.net/bills-of-exchange/)