FROM jupyter/pyspark-notebook:python-3.9.10

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

USER root

ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
ENV HADOOP_USER_NAME=hadoop

COPY --chmod=0644 --chown=root:root hadoop-config/* "${HADOOP_HOME}"/etc/hadoop/

RUN (  echo \
    && echo 'spark.master          yarn' \
    && echo 'spark.driver.memory   512m' \
    && echo 'spark.yarn.am.memory  512m' \
    && echo 'spark.executor.memory 512m' ) >> /usr/local/spark/conf/spark-defaults.conf

USER ${NB_UID}
