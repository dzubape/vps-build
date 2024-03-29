#!/bin/bash

set -e

docker-compose build --no-cache

if (( $? != 0 ))
then
    exit -1
fi

docker-compose up

exit 0