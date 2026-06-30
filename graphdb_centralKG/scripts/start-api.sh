
echo "Starting API..."

cd ../centralKG_api
uvicorn main:app --host 0.0.0.0 --port 8000