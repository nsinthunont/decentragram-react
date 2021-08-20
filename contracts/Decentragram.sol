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

  // define a publishing fee to stop people from spamming nonesense content
  uint256 publishingFee = 0.0000001 ether;

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
    address author,
    uint tipAmount
  );

  event PostTipped(
    uint postId,
    string mediaHash,
    string description,
    address author,
    uint tipAmount
  );

  function getPublisheingFee() public view returns (uint){
    return publishingFee;
  }

  function createPost(
    string memory _mediaHash,
    string memory _description
    ) public payable nonReentrant{
      
      // Make sure the author is paying the publishing fee
      require(msg.value == publishingFee, "Please ensure you have sufficient balance to pay the publishing fee");

      // Make sure the image hash exists
      require(bytes(_mediaHash).length > 0, "Every post needs to have a value IPFS hash");

      // Make sure the description exists
      require(bytes(_description).length > 0, "Please provide a description");      

      // Make sure the author address exists
      require(msg.sender != address(0x0), "Please double check your wallet address");

      // increment post id
      postIds.increment();
      uint _postId = postIds.current();

      // save post
      idToPost[_postId] = Post(
        _postId,
        _mediaHash,
        _description,
        payable(msg.sender),
        0
      );

      // pay the publishing fee
      payable(owner).transfer(msg.value);

      // emit post created event
      emit PostCreated(_postId, _mediaHash, _description, msg.sender, 0);
    
  }

  function tipAuthor(
    uint _postId
  ) public payable nonReentrant{

    // define post count
    uint postCount = postIds.current();

    // Check the post id
    require(_postId <= 0, "Post ID needs to be greater than 0");
    require(_postId > postCount, "Post ID is greater than post count");

    // get the address of the post's author
    Post memory _post = idToPost[_postId];
    address payable _author = _post.author;

    // send the tip amount to the author
    payable(_author).transfer(msg.value);

    // Increase tip amount, update the post and then emit
    _post.tipAmount += msg.value;
    idToPost[_postId] = _post;
    emit PostTipped(_postId, _post.mediaHash, _post.description, _post.author, _post.tipAmount);

  }

  function fetchPosts() public view returns (Post[] memory){

    uint postCount = postIds.current();

    Post[] memory _posts = new Post[](postCount);
    for (uint i = 0; i < postCount; i++){
      Post storage _post = idToPost[i+1];
      _posts[i] = _post;
    }

    return _posts;

  }

  function fetchMyPosts() public view returns (Post[] memory){

    uint _postCount = postIds.current();
    uint _myPostCount = 0;

    for (uint i = 0; i < _postCount; i++){
      if (idToPost[i+1].author == msg.sender){
        _myPostCount += 1;
      }
    }

    uint _currentIndex = 0;
    Post[] memory _posts = new Post[](_myPostCount);

    for (uint i = 0; i < _postCount; i++){
      if (idToPost[i+1].author == msg.sender){

        Post storage _currentPost = idToPost[i+1];

        _posts[_currentIndex] = _currentPost;
        _currentIndex += 1;

      }
    }

    return _posts;

  }

}