#!/bin/bash
#set variables

#$DIRECTORY = "./DockerCompose/AlfDemo2341/data/services/postgres/data"
# start the container stack
# (assumes the caller has permission to do this)
open -a docker

sleep 5

#check postgres data
cd ./DockerCompose/AlfDemo2341/data/services/postgres/
#now extract the postgres database and assume the alf_Data directory is coming down from git
if [ ! -d "./data/" ]; then
  echo "data directory does not exist...unzipping postgres backup"
  unzip data.zip -d data
else
  echo "postgres data directory is present...skipping"
fi

#check alf_data
cd ../content/
#now extract the postgres database and assume the alf_Data directory is coming down from git
if [ ! -d "./alf_data/" ]; then
  echo " alfdata directory does not exist...unzipping alf_data backup"
  unzip alf_data.zip -d alf_data
else
  echo "alfdata directory is present...skipping"
fi


cd ./Dockercompose/AlfDemo2341
docker compose up -d

# wait for the service to be ready
while ! curl --fail --silent --head http://localhost:8080; do
  sleep 1
done

# open the browser window
open http://localhost:8080