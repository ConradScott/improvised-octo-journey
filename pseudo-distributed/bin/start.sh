#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

hdfs namenode -format
start-dfs.sh
hdfs dfs -mkdir -p /user/hadoop
echo "NameNode - http://localhost:9870/"
