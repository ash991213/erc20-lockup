## Simple ERC20 Token Lockup Contract

- This is a simple Lockup Contract that allows restricting wallet transfers for a basic ERC20 Token.

- It restricts incoming and outgoing transfers of ERC20 tokens in a wallet based on the timestamp.

- Since it is based on the timestamp, the lockup on the wallet is automatically lifted after a certain period of time.

- The contract owner can unlock a specific wallet from their Contract Owner account.

## How To Deploy Contract

1. npm install

2. Create an .env file and set MNEMONIC (wallet recovery phrase 12 words) and PROJECT_ID (Infura API Key).

3. truffle compile || npx truffle compile

4. truffle migrate --network goerli || npx truffle migrate --network goerli

## Test Code

1. truffle test || npx truffle test
