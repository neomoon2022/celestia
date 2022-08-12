read -p "Enter image tag (v0.3.0-rc2): " TAG
echo "Checking $TAG ..."

docker run -itd \
    --name celestia \
    -p 9090:9090 \
    -p 26658:26658 \
    celestia-node:$TAG