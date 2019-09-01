#!/bin/bash
# This script are meant to run at the root of project

if [ -z `ssh-keygen -F $PROD_IP` ]; then
  ssh-keyscan -H $PROD_IP >> ~/.ssh/known_hosts
fi

eval "$(ssh-agent -s)"
chmod 600 deploy/.travis/deploy-key-id_rsa
ssh-add deploy/.travis/deploy-key-id_rsa

echo "Deploying on $PROD_IP"

ssh hungpmpercy@$PROD_IP <<EOF
  cd wedvn
  git fetch
  git branch -D master
  git checkout master
  git branch -D prod
  git checkout prod
  docker-compose up -d --build
  docker system prune -f
EOF
