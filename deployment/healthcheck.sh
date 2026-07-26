#!/bin/bash

set -euxo pipefail

LOG_DIR="$HOME/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/healthcheck.log"

exec >>"$LOG_FILE" 2>&1

BACKEND_URL="http://localhost:5000/api/health"

echo "$(date) Checking Backend Health..."

HTTP_STATUS=$(curl \
    --silent \
    --output /dev/null \
    --write-out "%{http_code}" \
    "$BACKEND_URL")

if [ "$HTTP_STATUS" -eq 200 ]; then

    echo "Backend Healthy"

    exit 0

fi

echo "Backend Unhealthy"

exit 1