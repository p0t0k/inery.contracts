## About System Contracts

The INERY blockchain platform is unique in that the features and characteristics of the blockchain built on it are flexible, that is, they can be changed, or modified completely to suit each business case requirement. Core blockchain features such as consensus, fee schedules, account creation and modification, token economics, block producer registration, voting, multi-sig, etc., are implemented inside smart contracts which are deployed on the blockchain built on the INERY platform.

Block.one implements and maintains INERY open source platform which contains, as an example, the system contracts encapsulating the base functionality for an INERY based blockchain. This document will detail each one of them, [inery.bios](#inerybios-system-contract), [inery.system](#inerysystem-system-contract), [inery.msig](#inerymsig-system-contract), [inery.token](#inerytoken-system-contract), [inery.wrap](#inerywrap-system-contract) along with a few other main concepts.

## Concepts

### System contracts, system accounts, priviledged accounts

At the genesis of an INERY based blockchain, there is only one account present: inery, which is the main system account. There are other system accounts, which are created by inery, and control specific actions of the system contracts mentioned earlier. Note that we are introducing the notion of system contract/s and system account/s. Also note that privileged accounts are accounts which can execute a transaction while skipping the standard authorization check. To ensure that this is not a security hole, the permission authority over these accounts is granted to inery.prods.

As you just learned the relation between an account and a contract, we are adding here that not all system accounts contain a system contract, but each system account has important roles in the blockchain functionality, as follows:

|Account|Priviledged|Has contract|Description|
|---|---|---|---|
|inery|Yes|It contains the `inery.system` contract|The main system account on an INERY based blockchain.|
|inery.msig|Yes|It contains the `inery.msig` contract|Allows the signing of a multi-sig transaction proposal for later execution if all required parties sign the proposal before the expiration time.|
|inery.wrap|Yes|It contains the `inery.wrap` contract.|Simplifies block producer superuser actions by making them more readable and easier to audit.|
|inery.token|No|It contains the `inery.token` contract.|Defines the structures and actions allowing users to create, issue, and manage tokens on INERY based blockchains.|
|inery.names|No|No|The account which is holding funds from namespace auctions.|
|inery.bpay|No|No|The account that pays the block producers for producing blocks. It assigns 0.25% of the inflation based on the amount of blocks a block producer created in the last 24 hours.|
|inery.prods|No|No|The account representing the union of all current active block producers permissions.|
|inery.ram|No|No|The account that keeps track of the SYS balances based on users actions of buying or selling RAM.|
|inery.ramfee|No|No|The account that keeps track of the fees collected from users RAM trading actions: 0.5% from the value of each trade goes into this account.|
|inery.saving|No|No|The account which holds the 4% of network inflation.|
|inery.stake|No|No|The account that keeps track of all SYS tokens which have been staked for NET or CPU bandwidth.|
|inery.vpay|No|No|The account that pays the block producers accordingly with the votes won. It assigns 0.75% of inflation based on the amount of votes a block producer won in the last 24 hours.|
|inery.rex|No|No|The account that keeps track of fees and balances resulted from REX related actions execution.|

### RAM

RAM is the memory (space, storage) where the blockchain stores data. If your contract needs to store data on the blockchain, like in a database, then it can store it in the blockchain's RAM using either a multi-index table, which can be found explained [here](https://developers.ine.io/inery-cpp/v1.3.1/docs/db-api) and [here](https://developers.ine.io/inery-cpp/docs/using-multi-index-tables) or a singleton, its definition can be found [here](https://github.com/INERY/inery.cdt/blob/develop/libraries/inerylib/singleton.hpp) and a sample of its usage [here](https://github.com/INERY/ine/blob/3fddb727b8f3615917707281dfd3dd3cc5d3d66d/contracts/inery.system/inery.system.hpp).
The INERY-based blockchains are known for their high performance, which is achieved also because the data stored on the blockchain is using RAM as the storage medium, and thus access to blockchain data is very fast, helping the performance benchmarks to reach levels no other blockchain has been able to.
RAM is a very important resource because of the following reasons: it is a limited resource, each INERY-based blockchain can have a different policy and rules around RAM, for example the public INE blockchain started with 64GB of RAM and after that the block producers decided to increase the memory with 1KiB (1024 bytes) per day, thus increasing constantly the supply of RAM for the price of RAM to not grow too high because of the increased demand from blockchain applications; also RAM it is used in executing many actions that are available on the blockchain, creating a new account for example (it needs to store in the blockchain memory the new account's information), also when an account accepts a new type of token a new record has to be created somewhere in the blockchain memory that holds the balance of the new token accepted, and that memory, the storage space on the blockchain, has to be purchased either by the account that transfers the token or by the account that accepts the new token type.
RAM is a scarce resource priced according to the unique Bancor liquidity algorithm which is implemented in the system contract [here](https://github.com/INERY/ine/blob/905e7c85714aee4286fa180ce946f15ceb4ce73c/contracts/inery.system/exchange_state.hpp).

### CPU

CPU is processing power, the amount of CPU an account has is measured in microseconds, it is referred to as "cpu bandwidth" on the cline get account command output and represents the amount of processing time an account has at its disposal when pushing actions to a contract.

### NET

As CPU and RAM, NET is also a very important resource in INERY-based blockchains. NET is the network bandwidth measured in bytes of transactions and it is referred to as "net bandwidth" on the cline get account command. This resource like CPU must be staked so that a contract's transactions can be executed.

### Stake

On INERY based blockchains, to be able to deploy and then interact with a smart contract via its implemented actions it needs to be backed up by resources allocated on the account where the smart contract is deployed to. The three resource types an INERY smart contract developer needs to know about are RAM, CPU and NET. You can __stake__ CPU and NET and you can __buy__ RAM. You will also find that staking/unstaking is at times referred to as delegating/undelegating. The economics of staking is also to provably commit to a promise that you'll hold the staked tokens, either for NET or CPU, for a pre-established period of time, in spite of inflation caused by minting new tokens in order to reward BPs for their services every 24 hours.

### Vote 

In a INERY-based network the blockchain is kept alive by nodes which are interconnected into a mesh, communicating with each other via peer to peer protocols. Some of these nodes are elected, via a __voting__ process, by the token holders to be producer nodes. They produce blocks, validate them and reach consensus on what transactions are allowed in each block, their order, and what blocks are finalized and stored forever in the blockchain memory. This way the governance, the mechanism by which collective decisions are made, of the blockchain is achieved through the 21 active block producers which are appointed by token holders' __votes__. It's the 21 active block producers which continuously create the blockchain by creating blocks, and securing them by validating them, and reaching consensus. Consensus is reached when 2/3+1 active block producers agree on validity of a block, that is all transactions contained in it and their order.

## System contracts defined in inery.contracts

1. [inery.bios](#inerybios-system-contract)
2. [inery.system](#inerysystem-system-contract)
3. [inery.msig](#inerymsig-system-contract)
4. [inery.token](#inerytoken-system-contract)
5. [inery.wrap](#inerywrap-system-contract)

### inery.bios system contract

The `inery.bios` is the first sample of system smart contract provided by `block.one` through the INERY platform. It is a minimalist system contract because it only supplies the actions that are absolutely critical to bootstrap a chain and nothing more. This allows for a chain agnostic approach to bootstrapping a chain.

The actions implemented and publicly exposed by `inery.bios` system contract are: setpriv, setalimits, setglimits, setprods, setparams, reqauth, setabi.

|Action name|Action description|
|---|---|
|setpriv|Set privilege status for an account.|
|setalimits|Set the resource limits of an account|
|setglimits|Not implemented yet.|
|setprods|Set a new list of active producers, that is, a new producers' schedule.|
|setparams|Set the blockchain parameters.|
|reqauth|Check if an account has authorization to access the current action.|
|setabi|Set the abi for a contract identified by an account name.|

The above actions are enough to serve the functionality of a basic blockchain, however, a keen eye would notice that the actions listed above do not allow for creation of an account, nor updating permissions, and other important features. As we mentioned earlier, this sample system contract is minimalist in its implementation, therefore it relies also on some native INERY actions. These native actions are not implemented in the `inery.bios` system contract, they are implemented at the INERY chain core level. In the `inery.bios` contract they are simply declared and have no implementation, so they can show in the contracts ABI definition, and therefore users can push these actions to the account that holds the `inery.bios` contract. When one of these actions are pushed to the chain, to the `inery.bios` contract account holder, via a `cline` command for example, the corresponding native action is executed by the blockchain first, [see the code here](https://github.com/INERY/ine/blob/3fddb727b8f3615917707281dfd3dd3cc5d3d66d/libraries/chain/apply_context.cpp#L58), and then the `inery.bios` contract `apply` method is invoked, [see the code here](https://github.com/INERY/ine/blob/3fddb727b8f3615917707281dfd3dd3cc5d3d66d/libraries/chain/apply_context.cpp#L69), but having no implementation and not being part of the `INERY_DISPATCH`, at the contract level, this action will be a NOP, it will do nothing when called from core INERY code.

Below are listed the actions which are declared in the `inery.bios` contract, mapped one-to-one with the native INERY actions, but having no implementation at the contract level:

|Action name|Description|
|---|---|
|newaccount|Called after a new account is created. This code enforces resource-limit rules for new accounts as well as new account naming conventions.|
|updateauth|Updates the permission for an account.|
|deleteauth|Delete permission for an account.|
|linkauth|Assigns a specific action from a contract to a permission you have created.|
|unlinkauth|Assigns a specific action from a contract to a permission you have created.|
|canceldelay|Allows for cancellation of a deferred transaction.|
|onerror|Called every time an error occurs while a transaction was processed.|
|setcode|Allows for update of the contract code of an account.|

### inery.system system contract

The `inery.system` contract is another smart contract that Block.one provides an implementation for as a sample system contract.  It is a version of `inery.bios` only this time it is not minimalist, it contains more elaborated structures, classes, methods, and actions needed for an INERY based blockchain core functionality:
- Users can stake tokens for CPU and Network bandwidth, and then vote for producers or delegate their vote to a proxy.
- Producers can register in order to be voted for, and can claim per-block and per-vote rewards.
- Users can buy and sell RAM at a market-determined price.
- Users can bid on premium names.
- A resource exchange system, named REX, allows token holders to lend their tokens, and users to rent CPU and NET resources in return for a market-determined fee.

The actions implemented and publicly exposed by the `inery.system` system contract are presented in the table below. Just like the `inery.bios` sample contract there are a few actions which are not implemented at the contract level (`newaccount`, `updateauth`, `deleteauth`, `linkauth`, `unlinkauth`, `canceldelay`, `onerror`, `setabi`, `setcode`), they are just declared in the contract so they will show in the contract's ABI and users will be able to push those actions to the chain via the account holding the 'inery.system' contract, but the implementation is at the INERY core level. They are referred to as INERY native actions.

|Action name|Action description|
|---|---|
|newaccount|Called after a new account is created. This code enforces resource-limits rules for new accounts as well as new account naming conventions.|
|updateauth|Updates the permission for an account.|
|deleteauth|Delete permission for an account.|
|linkauth|Assigns a specific action from a contract to a permission you have created.|
|unlinkauth|Assigns a specific action from a contract to a permission you have created.|
|canceldelay|Allows for cancellation of a deferred transaction.|
|onerror|Called every time an error occurs while a transaction was processed.|
|setabi|Allows for updates of the contract ABI of an account.|
|setcode|Allows for updates of the contract code of an account.|
|init|Initializes the system contract for a version and a symbol.|
|setram|Set the ram supply.|
|setramrate|Set the ram increase rate.|
|setparams|Set the blockchain parameters.|
|setpriv|Set privilege status for an account (turn it on/off).|
|setalimits|Set the resource limits of an account.|
|setacctram|Set the RAM limits of an account.|
|setacctnet|Set the NET limits of an account.|
|setacctcpu|Set the CPU limits of an account.|
|rmvproducer|Deactivates a producer by name, if not found asserts.|
|updtrevision|Updates the current revision.|
|bidname|Allows an account to place a bid for a name.|
|bidrefund|Allows an account to get back the amount it bid so far on a name.|
|deposit|Deposits core tokens to user REX fund.|
|withdraw|Withdraws core tokens from user REX fund.|
|buyrex|Buys REX in exchange for tokens taken out of user's REX fund by transferring core tokens from user REX fund and converting them to REX stake.|
|unstaketorex|Use staked core tokens to buy REX.|
|sellrex|Sells REX in exchange for core tokens by converting REX stake back into core tokens at current exchange rate.|
|cnclrexorder|Cancels unfilled REX sell order by owner if one exists.|
|rentcpu|Use payment to rent as many SYS tokens as possible as determined by market price and stake them for CPU for the benefit of receiver, after 30 days the rented core delegation of CPU will expire.|
|rentnet|Use payment to rent as many SYS tokens as possible as determined by market price and stake them for NET for the benefit of receiver, after 30 days the rented core delegation of NET will expire.|
|fundcpuloan|Transfers tokens from REX fund to the fund of a specific CPU loan in order to be used for loan renewal at expiry.|
|fundnetloan|Transfers tokens from REX fund to the fund of a specific NET loan in order to be used for loan renewal at expiry.|
|defcpuloan|Withdraws tokens from the fund of a specific CPU loan and adds them to the REX fund.|
|defnetloan|Withdraws tokens from the fund of a specific NET loan and adds them to the REX fund.|
|updaterex|Updates REX owner vote weight to current value of held REX tokens.|
|consolidate|Consolidates REX maturity buckets into one bucket that cannot be sold before 4 days.|
|mvtosavings|Moves a specified amount of REX to savings bucket.|
|mvfrsavings|Moves a specified amount of REX from savings bucket.|
|rexexec|Processes max CPU loans, max NET loans, and max queued sellrex orders. Action does not execute anything related to a specific user.|
|closerex|Deletes owner records from REX tables and frees used RAM. Owner must not have an outstanding REX balance.|
|buyrambytes|Increases receiver's ram in quantity of bytes provided.|
|buyram|Increases receiver's ram quota based upon current price and quantity of tokens provided.|
|sellram|Reduces quota my bytes and then performs an inline transfer of tokens to receiver based upon the average purchase price of the original quota.|
|delegatebw|Stakes SYS from the balance of one account for the benefit of another.|
|undelegatebw|Decreases the total tokens delegated by one account to another account and/or frees the memory associated with the delegation if there is nothing left to delegate.|
|refund|This action is called after the delegation-period to claim all pending unstaked tokens belonging to owner.|
|regproducer|Register producer action, indicates that a particular account wishes to become a producer.|
|unregprod|Deactivate the block producer with specified account.|
|voteproducer|Votes for a set of producers. This action updates the list of producers voted for, for given voter account.|
|regproxy|Set specified account as proxy.|
|onblock|This special action is triggered when a block is applied by the given producer and cannot be generated from any other source.|
|claimrewards|Claim block producing and vote rewards for block producer identified by an account.|

### inery.msig system contract

The `inery.msig` allows for the creation of proposed transactions which require authorization from a list of accounts, approval of the proposed transactions by those accounts required to approve it, and finally, it also allows the execution of the approved transactions on the blockchain.

The workflow to propose, review, approve and then executed a transaction is describe in details [here](./03_guides/06_how-to-sign-a-multisig-transaction-with-inery.msig.md), and in short it can be described by the following:
- first you create a transaction json file, 
- then you submit this proposal to the `inery.msig` contract, and you also insert the account permissions required to approve this proposal into the command that submits the proposal to the blockchain,
- the proposal then gets stored on the blockchain by the `inery.msig` contract, and is accessible for review and approval to those accounts required to approve it,
- after each of the appointed accounts required to approve the proposed transactions reviews and approves it, you can execute the proposed transaction.  The `inery.msig` contract will execute it automatically, but not before validating that the transaction has not expired, it is not cancelled, and it has been signed by all the permissions in the initial proposal's required permission list.

These are the actions implemented and publicly exposed by the `inery.msig` contract:
|Action name|Action description|
|---|---|
|propose|Creates a proposal containing one transaction.|
|approve|Approves an existing proposal.|
|unapprove|Revokes approval of an existing proposal.|
|cancel|Cancels an existing proposal.|
|exec|Allows an account to execute a proposal.|
|invalidate|Invalidate proposal.|

### inery.token system contract

The `inery.token` contract defines the structures and actions that allow users to create, issue, and manage tokens for INERY based blockchains.

These are the public actions the `inery.token` contract is implementing:
|Action name|Action description|
|---|---|
|create|Allows an account to create a token in a given supply amount.|
|issue|This action issues to an account a specific quantity of tokens.|
|open|Allows a first account to create another account with zero balance for specified token at the expense of first account.|
|close|This action is the opposite for `open` action, it closes the specified account for specified token.|
|transfer|Allows an account to transfer to another account the specified token quantity. One account is debited and the other is credited with the specified token quantity.|
|retire|This action is the opposite for `create` action.  If all validations succeed, it debits the specified amount of tokens from the total balance.|

The `inery.token` sample contract demonstrates one way to implement a smart contract which allows for creation and management of tokens. This contract gives anyone the ability to create a token. It is possible for one to create a similar contract which suits different needs.  However, it is recommended that if one only needs a token with the above listed actions, that one uses the `inery.token` contract instead of developing their own.

The `inery.token` contract class also implements two useful public static methods: `get_supply` and `get_balance`. The first allows one to check the total supply of a specified token, created by an account and the second allows one to check the balance of a token for a specified account (the token creator account has to be specified as well).

The `inery.token` contract manages the set of tokens, accounts and their corresponding balances, by using two internal multi-index structures: the `accounts` and `stats`. The `accounts` multi-index table holds, for each row, instances of `account` object and the `account` object holds information about the balance of one token. If we remember how multi-index tables work, see [here](https://developers.ine.io/inery-cpp/docs/using-multi-index-tables), then we understand also that the `accounts` table is scoped to an inery account, and it keeps the rows indexed based on the token's symbol.  This means that when one queries the `accounts` multi-index table for an account name the result is all the tokens that account holds at the moment.

Similarly, the `stats` multi-index table, holds instances of `currency_stats` objects for each row, which contains information about current supply, maximum supply, and the creator account for a symbol token. The `stats` table is scoped to the token symbol.  Therefore, when one queries the `stats` table for a token symbol the result is one single entry/row corresponding to the queried symbol token if it was previously created, or nothing, otherwise.

### inery.wrap system contract
The `inery.wrap` system contract allows block producers to bypass authorization checks or run privileged actions with 15/21 producer approval and thus simplifies block producers superuser actions. It also makes these actions easier to audit.

It does not give block producers any additional powers or privileges that do not already exist within the INERY based blockchains. As it is implemented, in an INERY based blockchain, 15/21 block producers can change an account's permissions or modify an account's contract code if they decided it is beneficial for the blockchain and community. 

However, the current method is opaque and leaves undesirable side effects on specific system accounts, and thus the `inery.wrap `contract solves this matter by providing an easier method of executing important governance actions.

The only action implemented by the `inery.wrap` system contract is the `exec` action. This action allows for execution of a transaction, which is passed to the `exec` method in the form of a packed transaction in json format via the 'trx' parameter and the `executer` account that executes the transaction. The same `executer` account will also be used to pay the RAM and CPU fees needed to execute the transaction.

Why is it easier for governance actions to be executed via this contract?
The answer to this question is explained in detailed [here](./03_guides/07_how-to-use-inery.wrap.md)