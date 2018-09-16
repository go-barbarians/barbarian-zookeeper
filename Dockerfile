FROM ubuntu:16.04

ENV ZK_USER=zookeeper \
    ZK_HOME=/opt/barbarian/zookeeper \
    ZK_DATA_DIR=/opt/barbarian/zookeeper/data \
    ZK_DATA_LOG_DIR=/opt/barbarian/zookeeper/data/log \
    ZK_LOG_DIR=/var/log/zookeeper \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    CLASSPATH="$CLASSPATH:/opt/barbarian/zookeeper/*:/opt/barbarian/zookeeper/lib/*"

RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless netcat-openbsd ca-certificates-java
RUN apt-get clean && \
    update-ca-certificates -f && \
    rm -rf /var/lib/apt/lists/*

COPY ./opt/barbarian /opt/barbarian

RUN set -x \
    && useradd $ZK_USER \
    && [ `id -u $ZK_USER` -eq 1000 ] \
    && [ `id -g $ZK_USER` -eq 1000 ] \
    && mkdir -p $ZK_DATA_DIR $ZK_DATA_LOG_DIR $ZK_LOG_DIR /tmp/zookeeper \
    && chown -R "$ZK_USER:$ZK_USER" $ZK_DATA_DIR $ZK_LOG_DIR $ZK_DATA_LOG_DIR /tmp/zookeeper \
    && ln -s /opt/barbarian/zookeeper/conf/ /etc/zookeeper
