# Command template prefix
DOCKER="docker run --rm -it --name celestia-script celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Address 
read -p "Enter address (celestia1xxxxxxxxxx0): " ADDRESS

# First, create an application CLI configuration file:
# celestia-appd config keyring-backend test
CMD="query bank balances $ADDRESS"
run "$CMD"
