FROM jupyter/pyspark-notebook:python-3.9.10

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

USER root

RUN (  echo \
    && echo 'spark.driver.memory   512m' \
    && echo 'spark.yarn.am.memory  512m' \
    && echo 'spark.executor.memory 512m' ) >> /usr/local/spark/conf/spark-defaults.conf

USER ${NB_UID}
