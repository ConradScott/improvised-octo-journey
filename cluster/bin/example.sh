#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

cd

rm -rf books
mkdir books

(
  cd books

  wget -O alice.txt https://www.gutenberg.org/files/11/11-0.txt
  wget -O holmes.txt https://www.gutenberg.org/files/1661/1661-0.txt
  wget -O frankenstein.txt https://www.gutenberg.org/files/84/84-0.txt

  hdfs dfs -rm -r -f books
  hdfs dfs -mkdir books
  hdfs dfs -put *.txt books
  hdfs dfs -ls books
)

hdfs dfs -rm -r -f output
hadoop jar "${HADOOP_HOME}"/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.2.jar wordcount 'books/*' output
hdfs dfs -cat output/part-r-00000 | more
