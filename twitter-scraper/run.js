const fetch = require('node-fetch');
const Twitter = require('twitter');
const { getKeywords } = require('./keywords');
const ApolloClient = require('apollo-boost').default;
const gql = require('graphql-tag').default;

const { env } = process;

const langType = 'en';

const graphqlc = new ApolloClient({
	uri: `http://${env.IP}:${env.GRAPHQL_PORT}/graphql`,
	fetch,
});
const query = gql`
	mutation CreateTwitterPayload($twitterId: BigInt!, $text: String!, $keywords: [String]!, $hashtags: [String]!){
		createTwitter(input: {
	    twitter: {
	      twitterId: $twitterId,
	      text: $text
	    	keywords: $keywords
	      hashtags: $hashtags
	    },
	    
	  }) {
		  twitter {
	      twitterId
	    }
		}	
	}
`;

const pushTweet = (twitterId, keywords, hashtags, text) => {
	graphqlc.mutate({
		mutation: query,
		variables: {
			twitterId, keywords, hashtags, text
		}
	})
	.then(data => console.log(data.data.createTwitter.twitter.twitterId, ' Pushed'))
	.catch(e => console.error(`Failed to push tweet:`, e))
};

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
	const { id, text, lang, entities } = tweet;
	if (lang === langType) {
		const hashtags = entities.hashtags.map(h => h.text);
		getKeywords(text, keywords => {
			pushTweet(id, keywords, hashtags, text);
		});
	}
})

stream.on('error', error => {
	console.log(`Failed to get weet: ${error}`);
});
