const defaultConfig = require('./jest.config');

module.exports = {
	...defaultConfig,
	testMatch: ['<rootDir>/**/__tests__/*.unit.test.js']
};
