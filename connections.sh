# set P2P Configuration Options
max_num_inbound_peers=40
max_num_outbound_peers=10
max_connections=50

sed -i -e "s/^use-legacy *=.*/use-legacy = false/;\
s/^max-num-inbound-peers *=.*/max-num-inbound-peers = $max_num_inbound_peers/;\
s/^max-num-outbound-peers *=.*/max-num-outbound-peers = $max_num_outbound_peers/;\
s/^max-connections *=.*/max-connections = $max_connections/" celestia-app-files/config/config.toml
