#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

(
  docker stop ioj-master || true
  docker stop ioj-worker-1 || true
  docker stop ioj-worker-2 || true

  docker rm ioj-master || true
  docker rm ioj-worker-1 || true
  docker rm ioj-worker-2 || true

  docker network rm ioj || true
) 2>/dev/null

docker volume rm -f ioj-master
docker volume rm -f ioj-worker-1
docker volume rm -f ioj-worker-2

docker volume create ioj-master
docker volume create ioj-worker-1
docker volume create ioj-worker-2

docker network create ioj

# ioj-master
docker run -dit --rm --init \
  --name ioj-master \
  -v ioj-master:/hadoop \
  --network ioj \
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
  gosu hadoop bash -ci "hdfs namenode -format && start-dfs.sh && hdfs dfs -mkdir -p /user/hadoop && stop-dfs.sh"

docker stop ioj-master ioj-worker-1 ioj-worker-2

docker network rm ioj
