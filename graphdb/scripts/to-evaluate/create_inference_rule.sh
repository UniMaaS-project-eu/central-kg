#!/bin/bash
set -e

. .env

echo "Creating custom ruleset 'unimaas'... in ${GRAPHDB_URL}"

curl -s \
  -H "Content-Type: application/sparql-update" \
  -X POST \
  --data-binary @- \
  "$GRAPHDB_URL/repositories/$REPO_ID/statements" <<'EOF'
PREFIX sys: <http://www.ontotext.com/owlim/system#>

INSERT DATA {
  <_:unimaas> sys:addRuleset '''
Prefices{
  sc: http://unimaas-project.eu/MSCOntology#
}

Axioms{}

Rules{

Id: unimaas

pc1 <sc:hasOutput> product
pc2 <sc:hasInput>  product
--------------------------------------
pc1 <sc:hasNextStep> pc2

}
'''
}
EOF

echo
echo "Listing rulesets..."

curl -s \
  -H "Accept: application/sparql-results+json" \
  --data-urlencode "query=
PREFIX sys: <http://www.ontotext.com/owlim/system#>

SELECT ?state ?ruleset {
  ?state sys:listRulesets ?ruleset
}" \
  "$GRAPHDB_URL/repositories/$REPO_ID"

echo
echo "Setting 'unimaas' as default ruleset..."

curl -s \
  -H "Content-Type: application/sparql-update" \
  -X POST \
  --data-binary @- \
  "$GRAPHDB_URL/repositories/$REPO_ID/statements" <<'EOF'
PREFIX sys: <http://www.ontotext.com/owlim/system#>

INSERT DATA {
  _:b sys:defaultRuleset "unimaas"
}
EOF

echo "Done."
