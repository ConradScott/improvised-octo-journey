#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker run -it --rm --init \
  --name ioj-edge-node \
  --network ioj \
  ioj-cluster:latest \
  "$@"
