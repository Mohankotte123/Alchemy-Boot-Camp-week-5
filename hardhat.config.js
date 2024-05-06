require('@nomicfoundation/hardhat-toolbox');

module.exports = {
  solidity: "0.8.17",
  paths: {
    artifacts: "./app/src/artifacts",
  },
  networks: {
    hardhat: {
      chainId: 31337, // Specify the chainId for your local network
    },
    
  },
};
