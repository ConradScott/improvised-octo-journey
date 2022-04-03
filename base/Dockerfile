FROM ubuntu:20.04

ENV JAVA_HOME="/usr/lib/jvm/java-11-amazon-corretto"

RUN    apt update \
    && apt install -y bash-completion bind9-dnsutils gosu iproute2 iputils-ping iputils-tracepath openssh-client openssh-server software-properties-common wget \
    \
    && wget -O- https://apt.corretto.aws/corretto.key | apt-key add -  \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    \
    && apt update \
    && apt install -y java-11-amazon-corretto-jdk \
    \
    && echo "JAVA_HOME=\"${JAVA_HOME}\"" >> /etc/environment

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

ENTRYPOINT [ "bin/entrypoint.sh" ]
CMD [ "bash" ]
