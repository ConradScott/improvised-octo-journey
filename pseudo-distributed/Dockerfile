FROM ioj-hadoop:latest

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

USER hadoop
WORKDIR /home/hadoop

COPY --chmod=0755 --chown=hadoop:hadoop bin/* bin/

USER root

COPY --chmod=0644 --chown=root:root hadoop-config/* "${HADOOP_HOME}"/etc/hadoop/

ENTRYPOINT [ "bin/entrypoint.sh" ]
CMD [ "bash" ]

# Hadoop NameNode
EXPOSE 9870
