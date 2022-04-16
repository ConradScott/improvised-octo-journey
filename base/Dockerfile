FROM ubuntu:20.04

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

ENV JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

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
