#!/bin/bash

set -euo pipefail

APP_DIR="$HOME/formflow-tracker"

cd "$APP_DIR"

if [ ! -f .previous_version ]; then
    echo "No previous version available."

    exit 1
fi

PREVIOUS_VERSION=$(cat .previous_version)

echo "Rolling back to ${PREVIOUS_VERSION}"

sed -i "s/^IMAGE_TAG=.*/IMAGE_TAG=${PREVIOUS_VERSION}/" .env

docker compose pull

docker compose up -d

echo "Rollback complete."