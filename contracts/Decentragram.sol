// contracts/Market.sol
// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract Decentragram is ReentrancyGuard {

  using Counters for Counters.Counter;
  Counters.Counter private postIds;

  address payable owner;
  uint256 publishingFee = 0.025 ether;

  constructor() {
    owner = payable(msg.sender);
  }

  struct Post {
    uint postId;
    string mediaHash;
    string description;
    address payable author;
    uint tipAmount;
  }

  mapping(uint => Post) private idToPost;

  event PostCreated(
    uint postId,
    string mediaHash,
    string description,
    address payable author,
    uint tipAmount
  );

  function createPost(
    string memory _mediaHash,
    string memory _description,
    ) public payable nonReentrant{
      
      // Make sure the author is paying the publishing fee
      require(msg.value == publishingFee, "Please ensure you have sufficient balance to pay the publishing fee")

      // Make sure the image hash exists
      require(bytes(_mediaHash).length > 0), "Every post needs to have a value IPFS hash";

      // Make sure the description exists
      require(bytes(_description).length > 0, "Please provide a description");      

      // Make sure the author address exists
      require(msg.sender != address(0x0), "Please double check your wallet address");

      // increment post id
      postIds.increment();
      uint _postId = postIds.current();

      idToPost[_postId] = Post(
        _postId,
        _mediaHash,
        _description,
        payable(msg.sender),
        0
      );

      emit PostCreated(_postId, _mediaHash, _description, msg.sender, 0)
    
  }

  

  



}