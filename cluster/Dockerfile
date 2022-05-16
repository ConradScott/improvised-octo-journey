FROM ioj-spark:latest

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

ENV HADOOP_HEAPSIZE_MAX=2G
ENV HDFS_NAMENODE_OPTS=-server\ -XX:+UseG1GC\ -Xms1536m\ -Xmx1536m\ -XX:PermSize=128m\ -XX:MaxPermSize=256m\ -Dhadoop.security.logger=INFO,DRFAS\ -Dhdfs.audit.logger=INFO,DRFAAUDIT
ENV HDFS_SECONDARYNAMENODE_OPTS=${HDFS_NAMENODE_OPTS}

RUN    echo "HADOOP_HEAPSIZE_MAX=\"${HADOOP_HEAPSIZE_MAX}\"" >> /etc/environment \
    && echo "HDFS_NAMENODE_OPTS=\"${HDFS_NAMENODE_OPTS}\"" >> /etc/environment \
    && echo "HDFS_SECONDARYNAMENODE_OPTS=\"${HDFS_SECONDARYNAMENODE_OPTS}\"" >> /etc/environment

USER hadoop
WORKDIR /home/hadoop

COPY --chmod=0755 --chown=hadoop:hadoop bin/* bin/

USER root

COPY --chmod=0644 --chown=root:root hadoop-config/* "${HADOOP_HOME}"/etc/hadoop/

ENTRYPOINT [ "bin/entrypoint.sh" ]
CMD [ "bash" ]

# Hadoop NameNode
EXPOSE 9870

# Yarn ResourceManager
EXPOSE 8088

# Yarn MapReduce JobHistory Server Web UI
EXPOSE 19888

# Spark master port
EXPOSE 7077

# Spark master UI port
EXPOSE 8080
