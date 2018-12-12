# Processing deployment

## About

This is a repository documenting my deployment setup progress.
The idea is to create a minimal processing system, that can be deployed, and then update it using improved tooling.

## Version 1

### Concept

Create a system that will:
- Monitor a specific hashtag
- Run keyword extraction on found text
- Using graphql save id, text, hashtags, keywords in a postgres database

### Shortcomings

- A docker image is used for postgres, which make's it difficult to deploy
- Only 1 hashtag is scrapped
- Difficult to share a environments file

### Deployment progress
