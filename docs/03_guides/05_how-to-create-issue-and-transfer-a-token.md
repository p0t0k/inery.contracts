## How to create, issue and transfer a token

## Step 1: Obtain Contract Source

Navigate to your contracts directory.

```text
cd CONTRACTS_DIR
```

Pull the source
```text
git clone https://github.com/INERY/inery.contracts --branch master --single-branch
```

```text
cd inery.contracts/contracts/inery.token
```

## Step 2: Create Account for Contract
[[info]]
| You may have to unlock your wallet first!

```shell
cline create account inery inery.token INE6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
```

## Step 3: Compile the Contract

```shell
inery-cpp -I include -o inery.token.wasm src/inery.token.cpp --abigen
```

## Step 4: Deploy the Token Contract

```shell
cline set contract inery.token CONTRACTS_DIR/inery.contracts/contracts/inery.token --abi inery.token.abi -p inery.token@active
```

Result should look similar to the one below:
```shell
Reading WASM from ...
Publishing contract...
executed transaction: 69c68b1bd5d61a0cc146b11e89e11f02527f24e4b240731c4003ad1dc0c87c2c  9696 bytes  6290 us
#         inery <= inery::setcode               {"account":"inery.token","vmtype":0,"vmversion":0,"code":"0061736d0100000001aa011c60037f7e7f0060047f...
#         inery <= inery::setabi                {"account":"inery.token","abi":"0e656f73696f3a3a6162692f312e30000605636c6f73650002056f776e6572046e61...
warning: transaction executed locally, but may not be confirmed by the network yet         ]
```

## Step 5: Create the Token

```shell
cline push action inery.token create '[ "inery", "1000000000.0000 SYS"]' -p inery.token@active
```

Result should look similar to the one below:
```shell
executed transaction: 0e49a421f6e75f4c5e09dd738a02d3f51bd18a0cf31894f68d335cd70d9c0e12  120 bytes  1000 cycles
#   inery.token <= inery.token::create          {"issuer":"inery","maximum_supply":"1000000000.0000 SYS"}
```

An alternate approach uses named arguments:

```shell
cline push action inery.token create '{"issuer":"inery", "maximum_supply":"1000000000.0000 SYS"}' -p inery.token@active
```

Result should look similar to the one below:
```shell
executed transaction: 0e49a421f6e75f4c5e09dd738a02d3f51bd18a0cf31894f68d335cd70d9c0e12  120 bytes  1000 cycles
#   inery.token <= inery.token::create          {"issuer":"inery","maximum_supply":"1000000000.0000 SYS"}
```
This command created a new token `SYS` with a precision of 4 decimals and a maximum supply of 1000000000.0000 SYS.  To create this token requires the permission of the `inery.token` contract. For this reason, `-p inery.token@active` was passed to authorize the request.

## Step 6: Issue Tokens

The issuer can issue new tokens to the issuer account in our case `inery`. 

```text
cline push action inery.token issue '[ "inery", "100.0000 SYS", "memo" ]' -p inery@active
```

Result should look similar to the one below:
```shell
executed transaction: a26b29d66044ad95edf0fc04bad3073e99718bc26d27f3c006589adedb717936  128 bytes  337 us
#   inery.token <= inery.token::issue           {"to":"inery","quantity":"100.0000 SYS","memo":"memo"}
warning: transaction executed locally, but may not be confirmed by the network yet         ]
```

## Step 7: Transfer Tokens

Now that account `inery` has been issued tokens, transfer some of them to account `bob`.

```shell
cline push action inery.token transfer '[ "inery", "bob", "25.0000 SYS", "m" ]' -p inery@active
```

Result should look similar to the one below:
```text
executed transaction: 60d334850151cb95c35fe31ce2e8b536b51441c5fd4c3f2fea98edcc6d69f39d  128 bytes  497 us
#   inery.token <= inery.token::transfer        {"from":"inery","to":"bob","quantity":"25.0000 SYS","memo":"m"}
#         inery <= inery.token::transfer        {"from":"inery","to":"bob","quantity":"25.0000 SYS","memo":"m"}
#           bob <= inery.token::transfer        {"from":"inery","to":"bob","quantity":"25.0000 SYS","memo":"m"}
warning: transaction executed locally, but may not be confirmed by the network yet         ]
```
Now check if "bob" got the tokens using [cline get currency balance](https://developers.ine.io/inery-cline/reference#currency-balance)

```shell
cline get currency balance inery.token bob SYS
```

Result:
```text
25.00 SYS
```

Check "inery's" balance, notice that tokens were deducted from the account 

```shell
cline get currency balance inery.token inery SYS
```

Result:
```text
75.00 SYS
```
