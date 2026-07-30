#!/usr/bin/env bash

MODE=$1
SERVICE=$1
ENV_FILE="../../ed-node/.env-connectorcp"

echo "deploy.sh: deploy $1 $2"
echo ".. action: $1"
echo ".. service: $2"
echo ".. env-file: $ENV_FILE"

if [ ! -f "$ENV_FILE" ]; then
  echo "Error: The file $ENV_FILE does not exist."
  exit 1
fi

# Export variables from the .env file
set -o allexport
source "$ENV_FILE"
set +o allexport

echo "deploy.sh: invoke docker compose $1 $2"
echo ".. CONNECTOR_HOST ${CONNECTOR_HOST}"
echo ".. INSTANCE_NAME ${ED_NODE_INSTANCE_NAME}"
echo
docker compose --project-name "${ED_NODE_INSTANCE_NAME}" $1 $2