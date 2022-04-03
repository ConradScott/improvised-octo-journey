#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker stop ioj-master || true
docker stop ioj-worker-1 || true
docker stop ioj-worker-2 || true

docker rm ioj-master || true
docker rm ioj-worker-1 || true
docker rm ioj-worker-2 || true

docker network rm ioj || true

docker volume rm ioj-master || true
docker volume rm ioj-worker-1 || true
docker volume rm ioj-worker-2 || true
