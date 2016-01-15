FROM java:openjdk-8-jdk

ADD https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.132/presto-server-0.132.tar.gz \
    /tmp/presto.tar.gz

RUN mkdir /opt/presto &\
    tar -zxvf /tmp/presto.tar.gz -C /opt/presto --strip-components=1 &\
    rm /tmp/presto.tar.gz

COPY config/* /opt/presto/etc/

RUN apt-get update && apt-get install -y \
    python

WORKDIR /opt/presto/

EXPOSE 8080

ENTRYPOINT ["bin/launcher", "run"]

