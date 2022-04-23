#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

docker build --pull --no-cache -t ioj-base:latest base
docker build --no-cache -t ioj-hadoop:latest hadoop
docker build --no-cache -t ioj-spark:latest spark
docker build --no-cache -t ioj-pseudo-distributed:latest pseudo-distributed
docker build --no-cache -t ioj-pseudo-distributed-yarn:latest pseudo-distributed-yarn
docker build --no-cache -t ioj-cluster:latest cluster
docker build --pull --no-cache -t ioj-jupyter:latest jupyter
