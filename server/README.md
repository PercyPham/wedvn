# wedvn-server

This is server code for wedvn project.

## Before Coding

Install all dependencies to enable auto check commit:

```
npm install
```

## Run Project

There are two places to run code during development:

- Current machine (for fast development)
- In Docker (validate docker build)

### For current machine, run:

```
npm install
npm run start
```

### For Docker:

```bash
# Build image
docker build -t hungpmpercy/wedvn-server .

# Run container
docker run --rm -it hungpmpercy/wedvn-server
```

Currently, the default command for docker to run is `npm start`, so if we want to run another command, then do it like this:

```
docker run --rm -it hungpmpercy/wedvn-server <override-command>
```

Example: `docker run --rm -it wedvn-server npm run test:unit`

## Test

### Write tests

All test file must be placed under `__tests__` folder next to its tested function file

Unit test file name must be end with `.unit.test.js`

Integration test file name must be end with `.int.test.js`

For example:

```
utilFunc
├── __tests__
│   └── utilFunc.unit.test.js
├── utilFunc.js
└── index.js
```

### Run tests

Unit test

```
npm run test:unit
```

Integration test

```
npm run test:integration
```

All test with coverage report (visual result will be placed in `.coverage` folder at same level with this README file)

```
npm run test:coverage
```

## Coding

### Check Before Commit

Run prettier and lint-fix before any commit to format code:

```
npm run prettier
npm run lint-fix
```

Check commit message, make sure it complies with [Commit Convention](https://www.conventionalcommits.org/en/v1.0.0-beta.2/).
