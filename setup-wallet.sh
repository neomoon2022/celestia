# Command template prefix
DOCKER="docker run --rm -it --name celestia-script -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# First, create an application CLI configuration file:
# celestia-appd config keyring-backend test
CMD="config keyring-backend test"
run "$CMD"

# Input 
read -p "Enter node name(wallet name): " WALLET_NAME

# You can pick whatever wallet name you want. 
# For our example we used "validator" as the wallet name:
# celestia-appd keys add validator
CMD="keys add $WALLET_NAME"
run "$CMD"

# To check all your wallets you can run:
# celestia-appd keys list
CMD="keys list"
run "$CMD"

# Configure validator mode
sed -i.bak -e "s/^mode *=.*/mode = \"validator\"/" celestia-app-files/config/config.toml