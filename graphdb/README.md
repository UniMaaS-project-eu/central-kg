# GraphDB

The knowledge graph is based on the MSC-Ontology which can be found here: https://github.com/UniMaaS-project-eu/MSC-Ontology-RDF

The following env vars are expected in the environment (e.g. in an .env file):
```sh
GRAPHDB_URL="http://localhost:7200"
REPO_ID="centralKG"
ADMIN_USER="admin"
ADMIN_PASS="mypassword"
```

To start the GraphDB:
```sh
docker compose up
```

To create the repository `centralKG`:
```sh
scripts/init-repo.sh
```
This will reate the repository `centralKG`, as specified by [repo-config.ttl](./config/repo-config.ttl), importing ontology [MSC-ontology-1.2.0.ttl](./config/MSC-ontology-1.2.0.ttl), completed with the statements [next-steps.ttl](./config/next-steps.ttl)

## Adding OWL statements for Inferring on the MSC-Ontology

In order to support the interoperability between the different processes in the MSC-Ontology, it is necessary to infer the predicate `sc:hasNextStep`. 
This inference is according to which product are input and output of each process, to support this we create a custom rule set in the centralKG GraphDB. 

To implement this rule, those statements must be added in the ontology:
- [graphdb/config/next-steps.ttl](./config/next-steps.ttl)

The ontology and the complementary owl statements are added in the repository when creating the repository.

## Testing the created inference rule:

We can see the inferred sc:hasNextStep predicate by inserting example triples:

```sparql
PREFIX  rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX  xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX  rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX  owl: <http://www.w3.org/2002/07/owl#> 

PREFIX sc: <http://unimaas-project.eu/MSCOntology#> 

SELECT DISTINCT ?pc1 ?pc2
WHERE
{
    {
      ?pc1 sc:hasNextStep ?pc2.
    }  
} LIMIT 10
```