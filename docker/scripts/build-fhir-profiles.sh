#!/bin/bash

if [ -z "$SUSHI_VERSION" ]; then
    SUSHI_VERSION=3.11.0
fi

if [ -z "$1" ]; then
    PROJECT_DIR=$PWD
else
    PROJECT_DIR=$1
fi

USER_SETTING="-u $(id -u):$(id -g)"
PROJECT_MOUNT="-v ${PROJECT_DIR}:/project"
IMAGE="ghcr.io/cybernop/build-fhir-profiles:${SUSHI_VERSION}"
DOCKER_OPTS="--pull always"

docker run --rm $USER_SETTING $SUSHI_ROOT $PROJECT_MOUNT $DOCKER_OPTS $IMAGE
