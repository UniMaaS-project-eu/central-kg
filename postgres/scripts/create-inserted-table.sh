echo "create-inserted-table.sh: called"

. ./env/postgres.env

CREATE_TABLE=$(cat ../launchers/digital-thread/postgres/table_creation.sql)

echo ".. database ${POSGRESS_DB}"

docker compose --project-name connectorcp exec central-platform-postgres psql -U ${POSTGRES_USER} -d ${POSGRESS_DB} -c "$CREATE_TABLE"