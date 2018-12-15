FROM postgres

RUN mkdir -p /tmp/psql_data/

COPY ./seed.sql /docker-entrypoint-initdb.d/
