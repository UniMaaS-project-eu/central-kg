echo "psql-shell.sh: called"

. ./env/postgres.env

echo ".. database ${POSGRESS_DB}"

docker compose --project-name connectorcp exec -it central-platform-postgres psql -U ${POSTGRES_USER} -d ${POSGRESS_DB}