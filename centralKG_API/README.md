# Access API for the Central KG

This folder implements the access API for the Central KG, as defined by the [openapi def](../docs/openapi.json).

## Requirements

Install a conda distribution:
```sh
# install
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh

# check (in a new terminal)
conda list
```

Install the required libraries for running this API. In a conda environment the installation can be done through the following:

```sh
conda install -c conda-forge fastapi
conda install conda-forge::pydantic
pip install fastapi[all] python-dotenv uvicorn
```

It expects an SPARQL endpoint accessible and the endpoint user and password. 
This can be set in the `api.env` file through the environment variables:

```sh
DMS_SPARQL_ADDRESS=localhost:3030/msc/data
DMS_SPARQL_USER=admin
DMS_SPARQL_PASSWORD=mypassword
```

To run the api, execute:
```sh
scripts/start-api.sh
```

The api will run on the port **8000** by default.

## API Specification and Documentation

This serves as the mid layer for accesing the central knowledge graph in UniMaaS. The API includes generic methods for accesing the knowledge graph content such as: getting all classes, instances, properties and values and also specific MSC queries related to the stage. Additionally, it contains a method for issuing SPARQL SELECT queries for more customized queries that are necessary for the other components. 

The full API documentation, requstd and expected responses can be verified through the swagger in **http://localhost:8000/docs**


## Useful documentation

- Uvicorn
  - [Home](https://uvicorn.dev/)


