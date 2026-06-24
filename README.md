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

## API

See [README](./centralKG_API/README.md).

## GraphDB

### Adding Inference Rules for MSC-Ontology

In order to support the interoperability between the different processes in the MSC-Ontology, it is necessary to infer the predicate sc:hasNextStep. 
This inference is according to which product are input and output of each process, to support this we create a custom rule set in the centralKG GraphDB. 

**IMPORTANT: This rule set creation should be done BEFORE inserting data into the GraphDB repository**.

To add this rule, in the SPARQL UI of GraphDB run the following commands:

First, create a custom rules set containing this rule named "unimaas" :

```
prefix sys: <http://www.ontotext.com/owlim/system#>

INSERT DATA {
    <_:unimaas> sys:addRuleset
        '''Prefices{sc:  http://unimaas-project.eu/MSCOntology#}
Axioms {}
Rules {
Id: unimaas
  pc1 <sc:hasOutput> product
  pc2 <sc:hasInput> product
  -------------------------------
  pc1 <sc:hasNextStep> pc2

}'''
}
```

Then, verify through the following query if indeed the unimaas rules set was created:

```
PREFIX sys: <http://www.ontotext.com/owlim/system#>

SELECT ?state ?ruleset {
    ?state sys:listRulesets ?ruleset
}
```

Finally, set the unimaas rules as the default rule set by running:

```
PREFIX sys: <http://www.ontotext.com/owlim/system#>

INSERT DATA {
    _:b sys:defaultRuleset "unimaas"
}
```

### Testing the created inference rule:

We can see the inferred sc:hasNextStep predicate by inserting example triples:

```
PREFIX sc: <http://unimaas-project.eu/MSCOntology#> 

INSERT data {
    sc:pc1 sc:hasOutput sc:prod1 .
    sc:pc2 sc:hasInput sc:prod1 .
}
```


and querying it:

```
PREFIX sys: <http://www.ontotext.com/owlim/system#>
PREFIX sc:  <http://unimaas-project.eu/MSCOntology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT *
WHERE {
    ?pc1 sc:hasNextStep ?pc2 .
}
```

The file /graphdb_centralKG/test_msc_rule.ttl has an extra case which can be used for testing this rule. 



