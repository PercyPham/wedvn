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
docker build -t wedvn .
```

Run container

```
docker run --rm -it wedvn
```

# Notes

For upgrading node version, need to update version in two files:

- Dockerfile
- package.json
