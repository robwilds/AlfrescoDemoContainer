#!/bin/bash
cd ./DockerCompose/AlfDemo2341/data/services/content/alf_data;
ECHO $PWD;
zip -r '../alf_data.zip' *;


cd ../../postgres/data;
ECHO $PWD;
zip -r '../data.zip' *;
