# Command template prefix
DOCKER="docker run --rm -it --name celestia-script -e CELESTIA_HOME=/root -v $PWD/celestia-app-files:/root celestia-app:latest"

# RUN FUNCTION
run () { echo "=> Running: $DOCKER $1"; eval "$DOCKER $1"; }

# Now we will setup the P2P Networks by cloning the networks repository
rm -rf networks
git clone https://github.com/celestiaorg/networks.git

# Input 
read -p "Enter node name(moniker): " NODE_NAME

# To initialize the network pick a "node-name" that describes your node. 
# The --chain-id parameter we are using here is mamaki. Keep in mind that this might change if a new testnet is deployed.
# celestia-appd init "node-name" --chain-id mamaki
CMD="init $NODE_NAME --chain-id mamaki"
run "$CMD"

# Copy the genesis.json file. For mamaki we are using:
# cp $HOME/networks/mamaki/genesis.json $HOME/.celestia-app/config
cp networks/mamaki/genesis.json celestia-app-files/config

# # Set seeds and peers:
BOOTSTRAP_PEERS=$(curl -sL https://raw.githubusercontent.com/celestiaorg/networks/master/mamaki/bootstrap-peers.txt | tr -d '\n')
echo $BOOTSTRAP_PEERS
sed -i.bak -e "s/^bootstrap-peers *=.*/bootstrap-peers = \"$BOOTSTRAP_PEERS\"/" celestia-app-files/config/config.toml

# Finished
echo "=> Done"



