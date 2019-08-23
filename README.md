# Wed.vn

Wed.vn helps spouses-to-be to connect with web designers, who can make beautiful presentations for their wedding.

## Setup Coding Environment

### Environment

Must install:

- Docker ([mac](https://docs.docker.com/docker-for-mac/install/) or [window](https://docs.docker.com/docker-for-windows/install/))
- Node (version >=12.8.1 <13.0.0)

_Note: recommend using `nvm` to easily switch between `node` versions._

### IDE

Use [VSCode](https://code.visualstudio.com/) to develop this project.

Install these extensions to VSCode:

- [npm](https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script)
- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [GitLens - Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

Open new `workspace` with file [wedvn.code-workspace](./wedvn.code-workspace) located in root of project. After that, tell git to ignore all changes in this file from now on:

```bash
# Tell git you want your own independent version of the file
git update-index --skip-worktree wedvn.code-workspace
```

## Conventions

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
