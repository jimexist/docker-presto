FROM java:openjdk-8-jdk

MAINTAINER Jiayu Liu <etareduce@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.132/presto-server-0.132.tar.gz \
    /tmp/presto.tar.gz

RUN mkdir /opt/presto &&\
    tar -zxvf /tmp/presto.tar.gz -C /opt/presto --strip-components=1 &&\
    rm /tmp/presto.tar.gz

ADD ./entrypoint.sh /opt/presto/entrypoint.sh

# copy default set of config
COPY config/* /opt/presto/etc/
# adding the config mounting point
VOLUME /opt/presto/etc/
# adding the data mounting point
VOLUME /opt/presto/data/

EXPOSE 8080

WORKDIR /opt/presto

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]

