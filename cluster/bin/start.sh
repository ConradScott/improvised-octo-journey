#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

start-dfs.sh
echo "NameNode - http://localhost:9870/"

start-yarn.sh
echo "ResourceManager - http://localhost:8088/"

mapred --daemon start historyserver
