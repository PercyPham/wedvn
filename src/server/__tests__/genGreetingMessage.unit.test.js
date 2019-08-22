const genGreetingMessage = require('../genGreetingMessage');

describe('genGreetingMessage', () => {
	test('returns correct message', () => {
		expect(genGreetingMessage()).toEqual({ message: 'Hello World!' });
	});
});
