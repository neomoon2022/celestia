# Set seeds and peers:
BOOTSTRAP_PEERS=$(curl -sL https://raw.githubusercontent.com/celestiaorg/networks/master/mamaki/bootstrap-peers.txt | tr -d '\n')

echo
echo $BOOTSTRAP_PEERS
sed -i.bak -e "s/^persistent-peers *=.*/persistent-peers = \"$BOOTSTRAP_PEERS\"/" celestia-app-files/config/config.toml


# Git
BOOTSTRAP_PEERS=$(curl -sL https://raw.githubusercontent.com/celestiaorg/networks/d98f45706b48e2ff99e9f23f3d46f0aa45a6de86/mamaki/peers.txt | tr -d '\n' )
echo
echo $BOOTSTRAP_PEERS

# echo $BOOTSTRAP_PEERS
sed -i.bak -e "s/^bootstrap-peers *=.*/bootstrap-peers = \"$BOOTSTRAP_PEERS\"/" celestia-app-files/config/config.toml

