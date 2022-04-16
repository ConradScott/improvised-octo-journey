#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

spark-submit --deploy-mode client --class org.apache.spark.examples.SparkPi $SPARK_HOME/examples/jars/spark-examples_2.13-3.2.1.jar
