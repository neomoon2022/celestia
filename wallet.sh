# Template
DOCKER="docker run --rm -it --name celestia -v $PWD/celestia-app-files:/root celestia-app:latest --home /root"

# First, create an application CLI configuration file:
# celestia-appd config keyring-backend test
CMD="config keyring-backend test"

SCRIPT="$DOCKER $CMD"
echo "Running: $SCRIPT"
eval $SCRIPT

# You can pick whatever wallet name you want. 
# For our example we used "validator" as the wallet name:
# celestia-appd keys add validator

CMD="keys add andromeda"

SCRIPT="$DOCKER $CMD"
echo "Running: $SCRIPT"
eval $SCRIPT

# To check all your wallets you can run:
# celestia-appd keys list

CMD="keys list"

SCRIPT="$DOCKER $CMD"
echo "Running: $SCRIPT"
eval $SCRIPT
