#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker build -t ioj-base:latest base
docker build -t ioj-hadoop:latest hadoop
docker build -t ioj-spark:latest spark
docker build -t ioj-pseudo-distributed:latest pseudo-distributed
docker build -t ioj-pseudo-distributed-yarn:latest pseudo-distributed-yarn
docker build -t ioj-cluster:latest cluster
