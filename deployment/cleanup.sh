#!/bin/bash

set -euxo pipefail

LOG_DIR="$HOME/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/cleanup.log"

exec >>"$LOG_FILE" 2>&1

echo ""
echo "========================================"
echo "$(date)"
echo "Docker Cleanup Started"
echo "========================================"

docker image prune -af

docker builder prune -af

docker container prune -f

docker volume prune -f

echo "Cleanup Complete"

echo "========================================"
echo "Cleanup Finished"
echo "========================================"