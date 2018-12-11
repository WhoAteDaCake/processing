const retext = require('retext');
const keywords = require('retext-keywords');
const toString = require('nlcst-to-string');

function getKeywords(data, cb) {
	retext()
		.use(keywords)
		.process(data, (error, file) => {
			const keywords = file.data.keywords.map(k => toString(k.matches[0].node))	
			cb(keywords);
		});
} 

module.exports = { getKeywords };

