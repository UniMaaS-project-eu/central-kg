echo "start.sh: called"

. ./env/postgres.env

echo ".. database ${POSGRESS_DB}"

docker compose --project-name connectorcp up -d central-platform-postgres