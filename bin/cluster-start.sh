#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker network create ioj

# ioj-master
docker run -dit --rm --init \
  --name ioj-master \
  -v ioj-master:/hadoop \
  --network ioj \
  -p 9870:9870/tcp -p 8088:8088/tcp -p 19888:19888/tcp \
  ioj-cluster:latest

# ioj-worker-1
docker run -dit --rm --init \
  --name ioj-worker-1 \
  -v ioj-worker-1:/hadoop \
  --network ioj \
  ioj-cluster:latest

# ioj-worker-2
docker run -dit --rm --init \
  --name ioj-worker-2 \
  -v ioj-worker-2:/hadoop \
  --network ioj \
  ioj-cluster:latest

docker exec -it \
  ioj-master \
  gosu hadoop bash -ci "./bin/start.sh"
