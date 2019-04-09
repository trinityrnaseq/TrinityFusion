#!/bin/bash

set -ev

VERSION=`cat VERSION.txt`

docker build -t trinityctat/trinityfusion:${VERSION} .
docker build -t trinityctat/trinityfusion:latest .

