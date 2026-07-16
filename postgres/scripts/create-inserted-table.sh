CREATE_TABLE=$(cat ../launchers/digital-thread/postgres/table_creation.sql)
docker compose exec central-platform-postgres psql -U admin -d mydb -c "$CREATE_TABLE"