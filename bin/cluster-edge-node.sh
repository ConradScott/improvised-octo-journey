#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker run -it --rm --init --network ioj ioj-cluster:latest
