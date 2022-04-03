#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

cd
rm -rf standalone-example
mkdir standalone-example
cd standalone-example
mkdir input
cp "${HADOOP_HOME}"/etc/hadoop/*.xml input
"${HADOOP_HOME}"/bin/hadoop jar "${HADOOP_HOME}"/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.2.jar grep input output 'dfs[a-z.]+'
cat output/*
