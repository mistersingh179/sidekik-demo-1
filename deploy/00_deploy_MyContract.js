const { ethers } = require("hardhat");

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  try{
    await deploy("MyContract", {
      from: deployer,
      args: [],
    });

    const { abi, address } = await deployments.get("MyContract");
    const MyContract = await ethers.getContractAt(abi, address);
    if(MyContract.addBalance){
      try{
        await MyContract.addBalance({
          value: ethers.constants.WeiPerEther,
        });
      }catch(e){
        console.log('error calling addBalance');
        console.log(e);
      }
    }
  }catch(e){
    console.log("unable to deploy MyContract")
    console.log("\x1b[31m", e);
    console.log("\x1b[0m");
  }


};
module.exports.tags = ["MyContract"];
