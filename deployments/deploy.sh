#!/bin/bash

set -euo pipefail

########################################
# FormFlow Deployment Script
########################################

IMAGE_TAG="${1:-}"

APP_DIR="$HOME/formflow-tracker"

if [ -z "$IMAGE_TAG" ]; then
    echo "Usage:"
    echo "./deployment/deploy.sh <version>"
    echo ""
    echo "Example:"
    echo "./deployment/deploy.sh v2.1.0"
    exit 1
fi

echo "========================================"
echo " FormFlow Deployment"
echo "========================================"
echo "Version : $IMAGE_TAG"
echo "Server  : $(hostname)"
echo "Date    : $(date)"
echo "========================================"

cd "$APP_DIR"

echo ""
echo "[1/6] Updating IMAGE_TAG..."

sed -i "s/^IMAGE_TAG=.*/IMAGE_TAG=${IMAGE_TAG}/" .env

echo "Done."

echo ""
echo "[2/6] Pulling latest Docker images..."

docker compose pull

echo "Done."

echo ""
echo "[3/6] Restarting containers..."

docker compose up -d

echo "Done."

echo ""
echo "[4/6] Waiting for containers..."

sleep 15

echo ""
echo "[5/6] Running health check..."

curl --fail http://localhost:5000/api/health

echo ""
echo "[6/6] Cleaning old Docker images..."

docker image prune -f

echo ""
echo "========================================"
echo " Deployment Successful!"
echo "========================================"

docker compose ps

echo ""
echo "Running Images"

docker images | grep formflow

echo ""
echo "Deployment completed successfully."