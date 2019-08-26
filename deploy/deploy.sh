#!/bin/bash
# This script are meant to run at the root of project

eval "$(ssh-agent -s)"
chmod 600 ./deploy/.travis/travis-id_rsa
ssh-add ./deploy/.travis/travis-id_rsa

echo "Deploying on $PROD_IP"

ssh hungpmpercy@$PROD_IP <<EOF
  cd wedvn
  git fetch && git pull
  docker-compose up -d --build
EOF
