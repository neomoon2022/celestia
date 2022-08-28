read -p "Enter App version (v0.6.0): " APP_VERSION
APP_VERSION=${APP_VERSION:='v0.6.0'}
echo "Checking $APP_VERSION ..."

echo "\nDownloading repo..."
rm -rf celestia-app
git clone https://github.com/celestiaorg/celestia-app.git
cd celestia-app

git checkout "tags/$APP_VERSION" -b $APP_VERSION

echo "\nBuinding image..."
docker build -t celestia-app:$APP_VERSION -t celestia-app:latest .