#!/usr/bin/env bash

. .env

echo "Wipe repo ${REPO_ID}"

curl -s \
  -X POST \
  -H "Content-Type: application/sparql-update" \
  --data-binary @- \
  "$GRAPHDB_URL/repositories/$REPO_ID/statements" <<'EOF'
DELETE {
  GRAPH ?g { ?s ?p ?o }
  ?s ?p ?o
}
WHERE {
  GRAPH ?g { ?s ?p ?o }
  { ?s ?p ?o }
}
EOF

echo "All data deleted from repository: $REPO_ID"
