#!/bin/bash

if [ ! -z `docker-compose ps -aq` ]; then
  docker-compose down
fi
