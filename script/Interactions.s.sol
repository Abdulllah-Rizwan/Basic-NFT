// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNFT is Script {
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT", block.chainid);
        mintNFTOnContract(mostRecentDeployed);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNFT(PUG);
        vm.stopBroadcast();
    }
}
