const express = require("express");
const { postgraphile } = require("postgraphile");
const { env } = process;

const app = express();

app.use(postgraphile(env.POSTGRES_URL, 'public', {
	graphiql: true
}));

app.listen(env.GRAPHQL_PORT);
