@echo off

:: Initialize DOCKER_COMPOSE_INSTANCES with empty string
SET DOCKER_COMPOSE_INSTANCES=

:: Set result of `docker-compose ps` to DOCKER_COMPOSE_INSTANCES
FOR /F "tokens=* USEBACKQ" %%F IN (
  `docker-compose ps -aq`
) DO (
  SET DOCKER_COMPOSE_INSTANCES=%%F
)

:: If DOCKER_COMPOSE_INSTANCES is not empty then clean it
IF NOT [%DOCKER_COMPOSE_INSTANCES%]==[] (
  docker-compose down
)
