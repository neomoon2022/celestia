# Command template prefix
DOCKER="docker run --rm -it --name celestia-script -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# To check all your wallets you can run:
# celestia-appd keys list
CMD="keys list"
run "$CMD"

# Input 
read -p "Enter key: " KEY

# Add wallet address
CMD="keys show $KEY -a"
echo "=> Wallet address"
run "$CMD"

# Add valoper address
CMD="keys show $KEY --bech val -a"
echo "=> Valoper address"
run "$CMD"

# Pub address
CMD="tendermint show-validator"
echo "=> Pub address"
run "$CMD"