const request = require('supertest');
const server = require('../server');

describe('server', () => {
	test('GET /api/smoke return message ok', done => {
		request(server)
			.get('/api/smoke')
			.expect('Content-Type', /json/)
			.expect(200, { message: 'Hello World!' }, done);
	});
});
