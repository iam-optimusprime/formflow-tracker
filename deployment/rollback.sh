#!/bin/bash

set -euxo pipefail

APP_DIR="$HOME/formflow-tracker"
LOG_DIR="$HOME/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/rollback.log"

exec >>"$LOG_FILE" 2>&1

echo ""
echo "========================================"
echo "$(date)"
echo "Rollback Started"
echo "========================================"

cd "$APP_DIR"

if [ ! -f ".previous_version" ]; then
    echo "No previous deployment found."

    exit 1
fi

PREVIOUS_VERSION=$(cat .previous_version)

echo "Rolling back to ${PREVIOUS_VERSION}"

sed -i "s/^IMAGE_TAG=.*/IMAGE_TAG=${PREVIOUS_VERSION}/" .env

docker compose pull

docker compose up -d

echo "$(date) Rollback Successful"

echo "========================================"
echo "Rollback Complete"
echo "========================================"