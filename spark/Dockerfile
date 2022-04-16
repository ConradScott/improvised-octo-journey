FROM ioj-hadoop:latest

SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]

ENV SPARK_HOME=/usr/local/spark
ENV LD_LIBRARY_PATH=${HADOOP_HOME}/lib/native
ENV PATH=$PATH:$SPARK_HOME/sbin:$SPARK_HOME/bin

# RUN    wget https://downloads.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz \
#     && echo '145ADACF189FECF05FBA3A69841D2804DD66546B11D14FC181AC49D89F3CB5E4FECD9B25F56F0AF767155419CD430838FB651992AEB37D3A6F91E7E009D1F9AE	spark-3.2.1-bin-hadoop3.2.tgz' | sha512sum -c - \
#     && tar xf spark-3.2.1-bin-hadoop3.2.tgz --owner=root --group=root -C /usr/local/ \
#     && ln -s /usr/local/spark-3.2.1-bin-hadoop3.2 "${SPARK_HOME}"
#     && rm spark-3.2.1-bin-hadoop3.2.tgz

ADD --chown=root:root cache/spark-3.2.1-bin-hadoop3.2.tgz /usr/local

RUN    ln -s /usr/local/spark-3.2.1-bin-hadoop3.2 "${SPARK_HOME}" \
    \
    && mkdir --mode=0755 "${SPARK_HOME}"/logs/ \
    && chown hadoop:hadoop "${SPARK_HOME}"/logs/ \
    \
    && echo "SPARK_HOME=\"${SPARK_HOME}\"" >> /etc/environment \
    && echo "LD_LIBRARY_PATH=\"${LD_LIBRARY_PATH}\"" >> /etc/environment \
    \
    && sed -i 's#^PATH=.*#PATH='"\"$PATH\""'#' /etc/environment

COPY --chmod=0644 --chown=root:root spark-config/* "${SPARK_HOME}"/conf/
