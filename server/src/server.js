const express = require('express');
const genGreetingMessage = require('./genGreetingMessage');

const server = express();

server.get('/', (req, res) => {
	res.status(200).send('Comming Soon!!!');
});

server.get('/api/smoke', (req, res) => {
	const greetingMessage = genGreetingMessage();
	res.status(200).json(greetingMessage);
});

module.exports = server;
