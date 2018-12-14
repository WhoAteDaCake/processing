FROM postgres

RUN mkdir -p /tmp/psql_data/

COPY ./seed.sql /tmp/psql_data/
COPY seed.sh /docker-entrypoint-initdb.d/

