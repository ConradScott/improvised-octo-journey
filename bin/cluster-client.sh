#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

# Since this node has no Hadoop or Spark configuration, it will need to be provided on the command line.
# The following command appears to be sufficient to run at least some Spark commands successfully:
#
# pyspark --master yarn --conf spark.hadoop.yarn.resourcemanager.hostname=ioj-master --conf spark.hadoop.fs.defaultFS=hdfs://ioj-master:9000

docker run -it --rm --init \
  --name ioj-client \
  --network ioj \
  ioj-spark:latest \
  "$@"
