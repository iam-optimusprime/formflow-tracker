#!/bin/bash

set -euxo pipefail

########################################
# Validate Input
########################################

if [ $# -ne 1 ]; then
    echo "Usage: ./deploy.sh <image_tag>"
    exit 1
fi

IMAGE_TAG="$1"

########################################
# Configuration
########################################

APP_DIR="$HOME/formflow-tracker"
LOG_DIR="$HOME/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/deploy.log"

exec >>"$LOG_FILE" 2>&1

echo ""
echo "========================================"
echo "$(date)"
echo "Starting Deployment"
echo "Deploying Version: $IMAGE_TAG"
echo "========================================"

########################################
# Go to Application Folder
########################################

cd "$APP_DIR"

########################################
# Save Current Version
########################################

CURRENT_VERSION=$(grep "^IMAGE_TAG=" .env | cut -d "=" -f2)

echo "$CURRENT_VERSION" > .previous_version

########################################
# Update Version
########################################

sed -i "s/^IMAGE_TAG=.*/IMAGE_TAG=${IMAGE_TAG}/" .env

echo "Updated IMAGE_TAG to ${IMAGE_TAG}"

########################################
# Pull Images
########################################

echo "Pulling Docker images..."

docker compose pull

########################################
# Restart Containers
########################################

echo "Starting containers..."

docker compose up -d

########################################
# Health Check
########################################

echo "Waiting for application..."

for i in {1..12}
do
    if ./deployment/healthcheck.sh
    then
        echo "Health check passed."
        break
    fi

    echo "Attempt ${i}/12 failed..."
    sleep 5

    if [ "$i" -eq 12 ]; then
        echo "Health check failed."

        ./deployment/rollback.sh

        exit 1
    fi
done

########################################
# Cleanup
########################################

./deployment/cleanup.sh

echo "$(date) Deployment Successful"

echo "$(date) ${IMAGE_TAG} SUCCESS" >> deployments.log

echo "========================================"
echo "Deployment Complete"
echo "========================================"