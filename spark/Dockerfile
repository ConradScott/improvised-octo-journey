FROM ioj-hadoop:latest

WORKDIR /tmp

ENV SPARK_HOME=/usr/local/spark-3.2.1-bin-hadoop3.2-scala2.13

# RUN    https://downloads.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2-scala2.13.tgz \
#     && echo '6E7D62BA0943CEF5EDD8220960900D3491C68CE0ACBF233DDCA2BFF6FF68984260D58F8161629478AA3CD3AA79270062D9B62330788A5CF1A39CE4E8422D15FE	hadoop-3.3.2.tar.gz' | sha512sum -c - \
#     && tar xf spark-3.2.1-bin-hadoop3.2-scala2.13.tgz --owner=root --group=root -C /usr/local/ \
#     && rm spark-3.2.1-bin-hadoop3.2-scala2.13.tgz

ADD --chown=root:root cache/spark-3.2.1-bin-hadoop3.2-scala2.13.tgz /usr/local

RUN echo "SPARK_HOME=\"${SPARK_HOME}\"" >> /etc/environment

USER hadoop
WORKDIR /home/hadoop

RUN ( echo && echo 'export PATH=$PATH:$SPARK_HOME/bin' ) >> .bashrc

USER root
