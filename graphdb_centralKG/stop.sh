#!/bin/bash

echo "Stopping API..."
pkill -f "uvicorn main:app"

echo "Stopping GraphDB..."
docker compose down
