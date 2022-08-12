GITHUB_REPOSITORY=celestiaorg
IMAGE_NAME=celestia-app

docker run --rm quay.io/skopeo/stable list-tags docker://ghcr.io/$GITHUB_REPOSITORY/$IMAGE_NAME