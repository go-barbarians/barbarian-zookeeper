FROM dockerbarbarians/barbarian-base:latest

ENV ZK_USER=hadoop \
    ZK_HOME=/opt/barbarian/zookeeper \
    ZK_DATA_DIR=/opt/barbarian/zookeeper/data \
    ZK_DATA_LOG_DIR=/opt/barbarian/zookeeper/data/log \
    ZK_LOG_DIR=/var/log/zookeeper \
    CLASSPATH="$CLASSPATH:/opt/barbarian/zookeeper/*:/opt/barbarian/zookeeper/lib/*"

COPY ./opt/barbarian /opt/barbarian

RUN ln -s /opt/barbarian/control/nc /usr/bin/nc

RUN mkdir -p $ZK_DATA_DIR $ZK_DATA_LOG_DIR $ZK_LOG_DIR /tmp/zookeeper \
    && chown -R "$ZK_USER" $ZK_DATA_DIR $ZK_LOG_DIR $ZK_DATA_LOG_DIR /tmp/zookeeper \
    && chgrp -R "$ZK_USER" $ZK_DATA_DIR $ZK_LOG_DIR $ZK_DATA_LOG_DIR /tmp/zookeeper \
    && ln -s /opt/barbarian/zookeeper/conf/ /etc/zookeeper
