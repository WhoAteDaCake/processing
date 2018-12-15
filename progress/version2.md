# Version 2

## Concept

Create a system that will:
- Monitor a specific hashtag
- Run keyword extraction on found text
- Using graphql save id, text, hashtags, keywords in a postgres database
- Use docker-compose to deploy using a single file 

## Things to improve

- Deploy all images to dockerhub
	- Add Dockerfile for graphql
	- Add scripts for deploying docker images
- Use docker-compose script

## Shortcomings

- Due to the fact that single dockerfile is used, it's hard to manage database dependencies
	- Current solution uses `wait-for.sh`, but that is not reasonable when the processing platform grows
- Still have to manually update docker images
- Twitter scraper timed out when running `docker-compose up` the first time
	- Probably because `wait-for` timeout has to be longer

## Deployment

- ssh into the server
- install `docker-compose`
- copy `docker-compose.yml` and `.env` files.
- update `IP` and `POSTGRES_URL` inside `.env`
- run `docker-compose -p processing up`
