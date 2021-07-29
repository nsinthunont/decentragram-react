# Decentragram

This inspired by [DAPP University](https://github.com/dappuniversity/decentragram) and is a unique implementation of the same concept; a decentralized clone of Instagram built using ReactJS, TailwindCSS, Solidity and Hardhat.

## Setup

To begin, create a react app

`npx create-react-app [name]`

Next, all the required blockchain dependancies need to be installed

`npm install ethers hardhat @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers web3modal @openzeppelin/contracts ipfs-http-client axios tailwindcss`

We will also need to install all the TailwindCSS dependancies

`npm install -D tailwindcss@latest postcss@latest autoprefixer@latest`

And then initialize

`npx tailwindcss init -p`

Finally, we find the src/index.css file and we delete everything and replace with:

```
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## Hardhat

In order to develop on the Blockchain, we need the Hardhdat development environment which can be initialize using:

'npx hardhat'

More details on how to configure Hardhat config files can be found in a blog post created by Nader Dabit [here](https://dev.to/dabit3/building-scalable-full-stack-apps-on-ethereum-with-polygon-2cfb)
