# Dockerized [PrestoDB](https://prestodb.io/)

## How to use

This repo comes with default config to spin up:

- presto
- postgresql and its connector
- mongodb and its connector
- mysql and its connector

So you only have to `docker-compose up` and use [CLI](https://prestodb.io/docs/current/installation/cli.html)
to access the presto container at `docker-host:8080`.

Note the databases themselves are also exposing the according default ports. So
you can try to insert data into them.
