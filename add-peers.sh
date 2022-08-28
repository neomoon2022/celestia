# Set seeds and peers:
BOOTSTRAP_PEERS=$(curl -sL https://raw.githubusercontent.com/celestiaorg/networks/master/mamaki/bootstrap-peers.txt | tr -d '\n')

# https://rpc-mamaki.pops.one/net_info
NBP=$(curl -sL https://rpc-mamaki.pops.one/net_info | jq -r .result.peers[].url | tr '\n' ',')
BOOTSTRAP_PEERS="$BOOTSTRAP_PEERS,$NBP" 

# echo $BOOTSTRAP_PEERS

# sed -i.bak -e "s/^bootstrap-peers *=.*/bootstrap-peers = \"$BOOTSTRAP_PEERS\"/" celestia-app-files/config/config.toml

