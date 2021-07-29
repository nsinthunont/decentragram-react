# Decentragram

This inspired by [DAPP University](https://github.com/dappuniversity/decentragram) and is a unique implementation of the same concept; a decentralized clone of Instagram built using ReactJS, TailwindCSS, Solidity and Hardhat.

## Setup

To begin, create a react app

#### `npx create-react-app [name]`

Next, all the required blockchain dependancies need to be installed

#### `npm install ethers hardhat @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers web3modal @openzeppelin/contracts ipfs-http-client axios tailwindcss`

We will also need to install all the TailwindCSS dependancies as well and then initialize Tailwind

#### `npm install -D tailwindcss@latest postcss@latest autoprefixer@latest`
#### `npx tailwindcss init -p`

Finally, we find the src/index.css file and we delete everything and replace with:

```
@tailwind base;
@tailwind components;
@tailwind utilities;
```