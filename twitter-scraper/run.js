const Twitter = require('twitter');
const { getKeywords } = require('./keywords');

const { env } = process;

const langType = 'en';

const client = new Twitter({
	consumer_key: env.TWITTER_CONSUMER_KEY ,
	consumer_secret: env.TWITTER_CONSUMER_SECRET,
	access_token_key: env.TWITTER_ACCESS_TOKEN,
	access_token_secret: env.TWITTER_ACCESS_TOKEN_SECRET
});

// Currently assumes one hastag
// And only listen for english tweets
console.log(`Listening to ${env.TWITTER_HASHTAGS}`);
const stream = client.stream('statuses/filter', { track: env.TWITTER_HASHTAGS });

stream.on('data', tweet => {
	const { id, text, lang } = tweet;
	if (lang === langType) {
		getKeywords(text, keywords => {
			console.log(id, keywords, text);
		});
	}
})

stream.on('error', error => {
	console.log(`Failed: ${error}`);
});
