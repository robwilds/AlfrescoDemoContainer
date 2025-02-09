#!/bin/sh

# start the container stack
# (assumes the caller has permission to do this)
open -a docker

sleep 5

cd ./Dockercompose/AlfDemo2341

docker compose up -d

# wait for the service to be ready
while ! curl --fail --silent --head http://localhost:8080; do
  sleep 1
done

# open the browser window
open http://localhost:8080