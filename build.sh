read -p "Enter Node git branch (v0.3.0-rc2): " GIT_BRANCH
GIT_BRANCH=${GIT_BRANCH:='v0.3.0-rc2'}

read -p "Enter App version (v0.6.0): " APP_VERSION
APP_VERSION=${APP_VERSION:='v0.6.0'}

echo "Checking $GIT_BRANCH ..."
echo "\nBuinding image..."

docker build \
    --build-arg GIT_BRANCH=$GIT_BRANCH \
    --build-arg APP_VERSION=$APP_VERSION \
    -t celestia-node:$GIT_BRANCH .