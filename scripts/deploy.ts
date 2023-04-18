import hre, { ethers } from "hardhat";

async function main() {
  try {
    const contract = await ethers.getContractFactory("ERC20");
    const erc20 = await contract.deploy();

    await erc20.deployTransaction.wait(6);

    console.log(
      `Deployed Contract
      Address: ${erc20.address}\n`
    );

    await hre.run("verify:verify", {
      address: erc20.address,
    });
  } catch (error) {
    throw error;
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
