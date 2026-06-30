#!/bin/bash
#set -e

. .env

echo "insert data in graphdb ${GRAPHDB_URL}"


echo
echo "Inserting test data..."

curl -s \
  -H "Content-Type: application/sparql-update" \
  -X POST \
  --data-binary @sparql/insert-data.sparql \
  "$GRAPHDB_URL/repositories/$REPO_ID/statements" 

echo
echo "Querying inferred triples..."

curl -s \
  -H "Accept: application/sparql-results+json" \
  --data-urlencode "query=
$(cat sparql/get-nextsteps.sparql)" \
  "$GRAPHDB_URL/repositories/$REPO_ID"

echo
echo "Done."
