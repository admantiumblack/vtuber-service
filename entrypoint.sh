#!/bin/bash
if [ $# = 1 ]
then
    if [ $1 = "test" ]
    then
        docker-compose -f ./test-docker-compose.yaml up
    fi
else
    docker-compose -f ./docker-compose.yaml up
fi