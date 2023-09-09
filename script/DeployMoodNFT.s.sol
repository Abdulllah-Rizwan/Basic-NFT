// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract DeployMoodNFT is Script {
    function run() external returns(MoodNFT){}

    function svgToImageURI(string memory svg) pure public returns(string memory){
        string memory baseUrl="data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));

        return string(abi.encode(baseUrl,svgBase64Encoded));
    }
}