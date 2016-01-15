FROM java:openjdk-8-jdk

ENV DEBIAN_FRONTEND noninteractive

ADD https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.132/presto-server-0.132.tar.gz \
    /tmp/presto.tar.gz

RUN mkdir /opt/presto &&\
    tar -zxvf /tmp/presto.tar.gz -C /opt/presto --strip-components=1 &&\
    rm /tmp/presto.tar.gz

COPY config/* /opt/presto/etc/

EXPOSE 8080

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]

