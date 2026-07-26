#!/bin/bash

set -e

echo "Cleaning Docker resources..."

docker image prune -f

docker builder prune -f

docker container prune -f

echo "Cleanup complete."