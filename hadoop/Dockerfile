FROM ioj-base:latest

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

RUN useradd --create-home --shell /bin/bash hadoop

USER hadoop
WORKDIR /home/hadoop

RUN    mkdir -p .ssh \
    && ssh-keygen -t rsa -P '' -f .ssh/id_rsa \
    && cat .ssh/id_rsa.pub >> .ssh/authorized_keys \
    && chmod 0600 .ssh/authorized_keys \
    \
    && mkdir --mode=0755 bin \
    \
    && ( echo && echo 'export PATH=$PATH:$HOME/bin' ) >> .bashrc

COPY --chmod=0400 --chown=hadoop:hadoop ssh-config/* .ssh/
COPY --chmod=0755 --chown=hadoop:hadoop bin/* bin/

USER root

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

USER root

ENTRYPOINT [ "bin/entrypoint.sh" ]
CMD [ "bash" ]
