# Command template prefix
DOCKER="docker run --rm -it --name celestia-script --network host -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Input 
read -p "Enter CELESTIA WALLET: " CELESTIA_WALLET

# Unjail 
CMD="tx slashing unjail --from=$CELESTIA_WALLET --keyring-backend=test --chain-id mamaki --node tcp://0.0.0.0:26657"
run "$CMD"