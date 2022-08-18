# Command template prefix
DOCKER="docker run --rm -it --name celestia-script --network host -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Input 
read -p "Enter wallet: " WALLET
read -p "Enter moniker: " NODENAME
read -p "Enter pub key: " PUBKEY

# Set validator
CMD="tx staking create-validator -y --amount 10000000utia --from $WALLET --moniker $NODENAME --pubkey $PUBKEY --commission-rate=0.1 --commission-max-rate=0.2 --commission-max-change-rate=0.01 --min-self-delegation=1000000 --keyring-backend=test --chain-id mamaki --node tcp://0.0.0.0:26657"
run "$CMD"