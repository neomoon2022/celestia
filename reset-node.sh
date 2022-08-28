# Command template prefix
DOCKER="docker run --rm -it --name celestia-script -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Unjail 
CMD="tendermint unsafe-reset-all"
run "$CMD"