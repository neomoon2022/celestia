# Command template prefix
DOCKER="docker run --rm -it --name celestia-script --network host -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Input 
read -p "Enter celestia address: " ADDRESS
read -p "Enter avaloper address: " AVALOPER
read -p "Enter TIA amount: " AMOUNT

# Set validator
CMD="tx staking delegate $AVALOPER ${AMOUNT}000000utia --from $ADDRESS --chain-id mamaki --node tcp://0.0.0.0:26657"
run "$CMD"