. .env

echo "Create repo ${REPO_ID}"

REPO_CONFIG="./config/repo-config.ttl"

echo "Waiting for GraphDB..."

until curl -sf "${GRAPHDB_URL}/rest/repositories" >/dev/null; do
    sleep 2
done

echo "GraphDB is ready."

if [ ! -f "$REPO_CONFIG" ]; then
    echo "Repository config not found:"
    echo "$REPO_CONFIG"
    exit 1
fi

echo "Creating repository..."

curl -v \
     -u "$ADMIN_USER:$ADMIN_PASS" \
     -F "config=@${REPO_CONFIG}" \
     "${GRAPHDB_URL}/rest/repositories"
