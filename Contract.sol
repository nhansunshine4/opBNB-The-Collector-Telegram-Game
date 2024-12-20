// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Define the "CollectorGameTelegram" contract
contract CollectorGameTelegram {
    // Mapping to track points collected by each player
    mapping(address => uint256) private collectorPoints;

    // Events
    event PointsCollected(address indexed player, uint256 currentPoints);
    event PointsReset(address indexed player);

    // Modifier to ensure valid address
    modifier validAddress(address player) {
        require(player != address(0), "Invalid player address");
        _;
    }

    // Function to retrieve a player's collected points
    function getCollectorPoints(
        address player
    ) external view returns (uint256) {
        return collectorPoints[player];
    }

    // Function to add collected points for a player
    function addCollectorPoints(
        address player,
        uint256 points
    ) external validAddress(player) {
        require(points > 0, "Points must be greater than zero");

        collectorPoints[player] += points;

        emit PointsCollected(player, collectorPoints[player]);
    }

    // Function to reset a player's collected points to zero
    function resetCollectorPoints(
        address player
    ) external validAddress(player) {
        collectorPoints[player] = 0;

        emit PointsReset(player);
    }
}
