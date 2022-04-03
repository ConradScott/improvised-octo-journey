#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker run -it --rm --init -p 9870:9870/tcp ioj-pseudo-distributed:latest
