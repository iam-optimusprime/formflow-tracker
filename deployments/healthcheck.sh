#!/bin/bash

set -euo pipefail

BACKEND_URL="http://localhost:5000/api/health"

echo "Running backend health check..."

HTTP_STATUS=$(curl \
    --silent \
    --output /dev/null \
    --write-out "%{http_code}" \
    "$BACKEND_URL")

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Backend is healthy."
    exit 0
fi

echo "Backend health check failed."

exit 1