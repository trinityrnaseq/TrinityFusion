#!/bin/bash

set -ev

VERSION=`cat VERSION.txt`

docker push trinityctat/trinityfusion:${VERSION}
docker push trinityctat/trinityfusion:latest


