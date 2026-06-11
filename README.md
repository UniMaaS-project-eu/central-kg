# MSC-based (Central) Knowledge Graph

This is a repository to be used for the deployment of the central knowledge graph in the DMS. 
It contains a docker-compose file to run a GraphDB instance and the API to access the Knowledge Graph.

To start the GraphDB and the KG API run:

```./start.sh```

At running this will:
- Run GraphDB on port 7200
- Create a centralKG repository
- Run the access API on port 8000

To stop GraphDB and API run:

```./stop.sh```

The knowledge graph is based on the MSC-Ontology which can be found here: https://github.com/UniMaaS-project-eu/MSC-Ontology-RDF

For details on the API, see folder centralKG_API.

