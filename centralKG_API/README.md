# Access API for the Central KG

This folder implements the access API for the Central KG.

## Requirements

Install the required libraries for running this API, in a conda environment the installation be done through the following:

`conda install -c conda-forge fastapi
conda install -c conda-forge uvicorn
conda install conda-forge::pydantic
pip install fastapi[all] python-dotenv uvicorn`

It expects an SPARQL endpoint accessible and the endpoint user and password. 
This can be set in the api.env file through the fields:

`
DMS_SPARQL_ADDRESS=localhost:3030/msc/data
DMS_SPARQL_USER=admin
DMS_SPARQL_PASSWORD=mypassword
`

To run the api, execute:

`cd centraKG_api
uvicorn main:app --reload`

The api will run on the port **8000** by default.

## API Specification and Documentation

This serves as the mid layer for accesing the central knowledge graph in UniMaaS. The API includes generic methods for accesing the knowledge graph content such as: getting all classes, instances, properties and values and also specific MSC queries related to the stage. Additionally, it contains a method for issuing SPARQL SELECT queries for more customized queries that are necessary for the other components. 

The full API documentation, requstd and expected responses can be verified through the swagger in **localhost:8000/docs**





