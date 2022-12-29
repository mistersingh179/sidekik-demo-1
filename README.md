# Sidekik-demo-1

This is the source code used in the sidekik demo video.

https://youtu.be/SFzeCaJU6ks

[![Sidekik Demo Video](https://i.ibb.co/c13Htbw/image.png)](https://www.youtube.com/watch?v=SFzeCaJU6ks)

## Setup

This project is using `hardhat` to setup the EVM chain and then `hardhat-deploy` to watch `contracts` directory and compile & deploy code as it changed. 

- The solidity code is in the `contracts` directory.
- Hardhat deployments scripts are in `deploy` directory.
- Output address & abi are stored in `contract-addresses.json` by `hardhat-deploy`

## Commands

- Use `npm run chain` to start the hardhat chain
- Use `npm run deploy` to watch code for changes & deploying them

## Usage with app.sidekik.xyz

- Run your project localy
- Open https://app.sidekik.xyz 
- Upload your `contract-addresses.json`

That's it. Sidekik will poll and monitor this file for changes, and when it changes, it will update the contract UI in real time.

## Questions?

- Message me on twitter @sandeeparneja
- Ask on stackoverflow with tag #sidekik

## Contribute

- Open a P.R. :-)

