FROM ioj-base:latest

ENV HADOOP_HOME=/usr/local/hadoop-3.3.2

# RUN    wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz \
#     && echo 'e8dcc18b1413664f7d6a12803eccdeb60fd786f3f91dda40410dc069d4dd911daf0f7d024b4351288b788d6a7aa4124607dbf94ac2f8d2fba5c826c8bea7c13d	hadoop-3.3.2.tar.gz' | sha512sum -c - \
#     && tar xf hadoop-3.3.2.tar.gz --owner=root --group=root -C /usr/local/ \
#     && rm hadoop-3.3.2.tar.gz

ADD --chown=root:root cache/hadoop-3.3.2.tar.gz /usr/local

RUN    mkdir --mode=0755 "${HADOOP_HOME}"/logs/ \
    && chown hadoop:hadoop "${HADOOP_HOME}"/logs/ \
    \
    && mkdir --mode=0755 /hadoop/ \
    && chown hadoop:hadoop /hadoop/ \
    \
    && echo "HADOOP_HOME=\"${HADOOP_HOME}\"" >> /etc/environment

VOLUME /hadoop

USER hadoop
WORKDIR /home/hadoop

RUN ( echo && echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin' ) >> .bashrc

COPY --chmod=0755 --chown=hadoop:hadoop bin/* bin/

USER root
