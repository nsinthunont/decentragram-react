require('chai').use(require('chai-as-promised')).should()

describe("Decentragram", function () {

  it("Should create a post and then fetch the post as part of my posts", async function(){

    const Decentragram = await ethers.getContractFactory("Decentragram");
    const decentragram = await Decentragram.deploy();
    await decentragram.deployed();
    const decentragramAddress = decentragram.address;

    let publishingFee = await decentragram.getPublisheingFee();
    publishingFee = publishingFee.toString();

    const [_, authorAddress] = await ethers.getSigners();

    // Should fail because the wallet did not send publishing fee
    await decentragram.connect(authorAddress).createPost('abc','test description', {value : 0}).should.be.rejected;
    await decentragram.connect(authorAddress).createPost('abc','test description', {value : 1}).should.be.rejected;

    // Should succeed
    await decentragram.connect(authorAddress).createPost('abc','test description', {value : publishingFee});

    // Get all the authors posts
    let authorPosts = await decentragram.connect(authorAddress).fetchMyPosts();

    console.log(authorPosts)

  })
})
