FROM ubuntu:16.04

ENV ZK_USER=zookeeper \
    ZK_DATA_DIR=/zookeeper/data \
    ZK_DATA_LOG_DIR=/zookeeper/log \
    ZK_LOG_DIR=/var/log/zookeeper \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    CLASSPATH="$CLASSPATH:/zookeeper/*:/zookeeper/lib/*"

RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless netcat-openbsd
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f && \
    rm -rf /var/lib/apt/lists/*
COPY ./zookeeper /zookeeper
RUN set -x \
    && useradd $ZK_USER \
    && [ `id -u $ZK_USER` -eq 1000 ] \
    && [ `id -g $ZK_USER` -eq 1000 ] \
    && mkdir -p $ZK_DATA_DIR $ZK_DATA_LOG_DIR $ZK_LOG_DIR /usr/share/zookeeper /tmp/zookeeper /usr/etc/ \
    && chown -R "$ZK_USER:$ZK_USER" $ZK_DATA_DIR $ZK_LOG_DIR $ZK_DATA_LOG_DIR /tmp/zookeeper \
    && ln -s /zookeeper/conf/ /usr/etc/zookeeper \
    && ln -s /zookeeper/bin/* /usr/bin \
    && ln -s /zookeeper/lib/* /usr/share/zookeeper
