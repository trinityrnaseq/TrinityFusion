#!/bin/bash

VERSION=`cat VERSION.txt`

docker build -t trinityctat/trinityfusion:${VERSION} .

singularity build trinityfusion.v${VERSION}.simg docker://trinityctat/trinityfusion:${VERSION}

singularity exec -e trinityfusion.v${VERSION}.simg  /usr/local/src/TrinityFusion/TrinityFusion --version


