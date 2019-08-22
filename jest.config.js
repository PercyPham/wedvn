module.exports = {
	coverageDirectory: './.coverage',
	modulePathIgnorePatterns: ['<rootDir>[/\\\\](scripts|build|docs|public)[/\\\\]'],
	testMatch: ['<rootDir>/**/__tests__/*.test.js'],
	testPathIgnorePatterns: ['<rootDir>/node_modules/']
};
