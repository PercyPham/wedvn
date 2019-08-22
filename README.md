# wedvn

Use VSCode to develop this project

Things to install before use:

- Node (12.8.1 - can use nvm to control node version)
- Docker

## Run project

Start project

```
npm install
npm start
```

## Run with docker

Build Image

```
docker build -t hungpmpercy/wedvn .
```

Run container

```
docker run --rm -it hungpmpercy/wedvn
```

Currently, the default command for docker to run is `npm start`, so if we want to run another command, then do it like this:

```
docker run --rm -it hungpmpercy/wedvn <override-command>
```

Example: `docker run --rm -it wedvn npm run test:unit`

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

All test with coverage report (graphical result will be placed in `.coverage` folder at root)

```
npm run test:coverage
```

## Convention

### Commit Message

This project follows [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.2/) to make commit messages.

To comprehense it easily, here are some examples from [Semantic Commit Messages](https://seesparkbox.com/foundry/semantic_commit_messages):

```
chore: add Oyster build script
docs: explain hat wobble
feat: add beta sequence
fix: remove broken confirmation message
refactor: share logic between 4d3d3d3 and flarhgunnstow
style: convert tabs to spaces
test: ensure Tayne retains clothing
```

## Notes

For upgrading node version, need to update version in two files:

- Dockerfile
- package.json
