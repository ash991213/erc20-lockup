const Lockup = artifacts.require('Lockup');

function toEther(value) {
	return web3.utils.fromWei(value, 'ether');
}

function minutes(min) {
	return +new Date() + 60000 * min;
}

async function errException(promise) {
	try {
		await promise;
	} catch (error) {
		return error.reason;
	}
	assert.fail('Expected throw not received');
}

contract('Lockup', (accounts) => {
	let contract;

	beforeEach(async () => {
		contract = await Lockup.new();
	});

	it(`[SUCCESS] owner's token balance should be 10000`, async () => {
		const owner = await contract.owner();
		const balance = await contract.balanceOf(owner);

		assert.equal(toEther(balance.toString()), 10000, "10000 wasn't in the contract owner's account");
	});

	it('[SUCCESS] should not be ERC20 transfer executed', async () => {
		const owner = await contract.owner();
		const lockTime = minutes(5);

		await contract.freezeAccount(owner, lockTime);

		await errException(contract.transfer(accounts[0], 100));
	});

	it('[SUCCESS] should be ERC20 transfer', async () => {
		const owner = await contract.owner();

		await contract.unFreezeAccount(owner);

		await contract.transfer(accounts[0], 10000);

		const balance = await contract.balanceOf(accounts[0]);

		assert.equal(toEther(balance.toString()), 10000, "10000 wasn't in the test account");
	});
});
