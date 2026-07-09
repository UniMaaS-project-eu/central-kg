#/bin/bash
# must be run at the root of the project (folder centralKG_API)
docker image rm -f centralkg-api
docker build --no-cache -t centralkg-api:latest .