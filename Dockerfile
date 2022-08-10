FROM ubuntu:22.04 as base

# Install Dependencies
RUN apt update -y
RUN apt install curl tar wget clang pkg-config libssl-dev jq build-essential git make ncdu -y

# Set working dir
WORKDIR $HOME

# Install Golang
RUN echo $HOME
RUN wget "https://golang.org/dl/go1.18.2.linux-amd64.tar.gz"
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf "go1.18.2.linux-amd64.tar.gz"
RUN rm "go1.18.2.linux-amd64.tar.gz"

# Now we need to add the /usr/local/go/bin directory to $PATH:
ENV PATH "$PATH:/usr/local/go/bin:$HOME/go/bin" 

# Install Celestia Node
RUN rm -rf celestia-node
RUN git clone https://github.com/celestiaorg/celestia-node.git
WORKDIR $HOME/celestia-node
RUN git checkout tags/v0.3.0-rc2
RUN make install

# Add Celestia to $PATH:
ENV PATH "$PATH:/root/go/bin"

# Write to bashrc
RUN echo "export PATH=${PATH}" >> /root/.bashrc

# Set parameters
ENV ENDPOINT "<none>"

# Start
CMD celestia light init && celestia light start --core.grpc https://rpc-mamaki.pops.one:9090


