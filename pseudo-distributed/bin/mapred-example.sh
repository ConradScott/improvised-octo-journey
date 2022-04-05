#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

hdfs dfs -mkdir input
hdfs dfs -put "${HADOOP_HOME}"/etc/hadoop/*.xml input
hadoop jar "${HADOOP_HOME}"/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.2.jar grep input output 'dfs[a-z.]+'
hdfs dfs -cat 'output/*'
