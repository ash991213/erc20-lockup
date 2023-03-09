const Lockup_Contract = artifacts.require('Lockup');

module.exports = (deployer) => {
	deployer.deploy(Lockup_Contract);
};
