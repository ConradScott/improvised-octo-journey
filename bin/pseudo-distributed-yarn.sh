#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker run -it --rm --init -p 9870:9870/tcp -p 8088:8088/tcp -p 19888:19888/tcp ioj-pseudo-distributed-yarn:latest
