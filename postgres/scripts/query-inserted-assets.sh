echo "query-inserted-table.sh: called"

. env/postgres.env

echo ".. database ${POSGRESS_DB}"

docker compose --project-name connectorcp exec central-platform-postgres  psql -U ${POSTGRES_USER} -d ${POSGRESS_DB} -c "SELECT * FROM inserted_assets"