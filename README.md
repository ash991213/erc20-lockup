## Simple ERC20 Token Lockup Contract

- 기본 ERC20 Token에 대한 지갑 Transfer를 제한 할 수 있는 간단한 Lockup Contract 입니다.

- Timestamp를 기준으로 지갑에 ERC20 Token 입출금을 제한합니다.

- Timestamp를 기준으로 하기 때문에 지갑에 대한 잠금은 일정시간이 지나면 자동으로 풀립니다.

- Contract Owner 계정에서 임의의 지갑의 잠금을 해제할 수 있습니다.

## How To Deploy Contract

1. npm install

2. `.env` 파일을 생성하여 `MNEMONIC` ( 지갑 복구 구문 12단어 ), `PROJECT_ID` ( Infura API Key )를 설정합니다.

3. truffle compile || npx truffle compile

4. truffle migrate --network goerli || npx truffle migrate --network goerli

## Test Code

1. truffle test || npx truffle test
