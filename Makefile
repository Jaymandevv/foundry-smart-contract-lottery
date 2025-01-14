-include .env

# These special targets are called phony and you can explicitly tell Make they're not associated with files.
# so we reserve the target keywords for the scripts instead of being associated with a file which is the default
# of Make
.PHONY: all test deploy

build:; forge build

test:; forge test

install:; forge install cyfrin/foundry-devops@0.2.2 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit && forge install foundry-rs/forge-std@v1.8.2 --no-commit && forge install transmissions11/solmate@v6 --no-commit


deploy-sepolia: 
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_RPC_URL) --account testAcc --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv