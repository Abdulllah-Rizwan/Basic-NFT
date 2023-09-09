// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract TestBasicNFT is Test {
    DeployBasicNFT deployer;
    BasicNFT basicNFT;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedname = "Dogie";
        string memory ActualName = basicNFT.name();
        assert(keccak256(abi.encodePacked(expectedname)) == keccak256(abi.encodePacked(ActualName)));
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(PUG);

        assert(basicNFT.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }
}
