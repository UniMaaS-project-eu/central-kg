# MSC-based (Central) Knowledge Graph

This is a repository to be used for the deployment of the central knowledge graph in the DMS. 

It provides the following components and artifacts
- an openapi service to access the triple store 
- a docker compose, defining all the services specific to the central platform (next to the ed-node services):
  - a triple store: graphdb
  - a postgres intance, used by
    - the federated catalog server for its persistence
    - the digital thread agent, to keep track on the datasets loaded
  - the openapi service
  - the federated catalog
  - the digital thread agent

At running this will:
- Run GraphDB on port 7200
- Run the access API on port 8000

## Set up

### Postgres
- settings: 
  - [postgres.env](./env/postgres.env)
- helpers
  - [psql](./postgres/scripts/psql-shell.sh)
  - [create-inserted-table.sh](./postgres/scripts/create-inserted-table.sh)

Make sure
- posges is started
- the inderted-table is created and empty

### KG API

- settings
  - [api.env](./centralKG_API/api.env)
- helpers
  - [start-api.sh](./centralKG_API/scripts/start-api.sh)
  - [build-image.sh](./centralKG_API/scripts/build-image.sh)

### Stand alone federated catalog

- settings
  - [standalone-catalog.env](./env/standalone-catalog.env)
    - note the vault token `edc.vault.hashicorp.token`
    - to be retrieved from `\vault-token\token` on connectorcp connector file system.

## Run

- helpers
  - [deploy.sh](./deploy.sh)
    - used for starting/stopping cp services

### Postgres
```sh
# start postgres
./deploy.sh up central-platform-postgres

# check
postgres/scripts/psql-shell.sh

# stop postgres
./deploy.sh down central-platform-postgres

# create the inserted table
postgres/scripts/create-inserted-table.sh
```

### Graphdb

See [README](./graphdb/README.md).

```sh
# start graphdb
./deploy.sh up central-platform-graphdb
```

### Federated Catalog

```sh
# start the federated catalog
./deploy.sh up central-platform-federated-catalog | tee log/central-platform-federated-catalog-run10.log

# stop the federated catalog
./deploy.sh down central-platform-federated-catalog
./deploy.sh restart central-platform-federated-catalog
```

## Digital thread

```sh
# start the digital thread
./deploy.sh up central-platform-digital-thread 2>&1 | tee log/central-platform-digital-thread-run1.log

# stop the digital thread
./deploy.sh down central-platform-digital-thread 
```


## API

See [README](./centralKG_API/README.md).

