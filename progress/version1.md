# Concept

Create a system that will:
- Monitor a specific hashtag
- Run keyword extraction on found text
- Using graphql save id, text, hashtags, keywords in a postgres database

# Shortcomings

- A docker image is used for postgres, which make's it difficult to deploy
- Only 1 hashtag is scrapped
- Difficult to share a environments file
- No docker container for graphql server
- In order to export postgresql table has to go inside the container. This is because pgAdmin container version seems to have another version.

# Deployment progress

## Setup

Download github repo as zip and transfer it to local server.
`scp /path/to/file username@a:/path/to/destination`

Unzip the folder
```
sudo apt-get install unzip
unzip processing-master.zip
rm processing-master.zip
```

Create `env.docker` and `env.sh` inside the folder. Make sure to update the IP and GRAPHQL_URL

## Postgres

Go inside `database/postgres` and run `postges.sh` script. Now that we have the database running, we should copy local table schema, so it can be moved to deployed version.

Now that we have postgres, we need to copy old table from local db. Go inside the container using `docker exec -it container_id /bin/sh` and run `pg_dump --file "/usr/local/content" --host "0.0.0.0" --port "5432" --username "postgres" --no-password --verbose --format=p --blobs --schema-only "content"`.

Next step is to move the file out of the docker image. Run `docker cp <containerId>:/file/path/within/container /host/path/target`. Now, just open it inside a text editor and copy the script. Now open pgAdmin and run the script inside sql runner

## Graphql

Setup node using `nvm` and run `npm i -g yarn` to install yarn. Go to `databse/graphql` and run `yarn install`. Go back to root directory and run `source env.sh && node database/graphql/index.js`

## Twitter-scraper

Get inside `twitter-scrapper` and run `yarn install`. Go back to root and run `source env.sh && node twitter-scraper/run.js`
