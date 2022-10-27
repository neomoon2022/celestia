# Command template prefix
DOCKER="docker run --rm -it --name celestia-script --network host -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Input 
read -p "Enter CELESTIA WALLET: " CELESTIA_WALLET
read -p "Enter moniker: " MONIKER
read -p "Enter website: " WEBSITE
read -p "Enter details: " DETAILS
read -p "Enter identity: " IDENTITY

MONIKER="AndromedaPool"
CELESTIA_WALLET="celestia16hm4xzn9uwjgmwv82ue5hwhq4zxl6vr32j73va"
WEBSITE="https://twitter.com/andromedapool"
DETAILS="🚀 Crypto Staking pool 🌔"
IDENTITY="CD084C82AA2EE89E"

# Run
CMD="tx staking edit-validator --from=$CELESTIA_WALLET --new-moniker=$MONIKER --website=$WEBSITE --details='$DETAILS' --identity=$IDENTITY --chain-id mamaki --node tcp://0.0.0.0:26657"
run "$CMD"