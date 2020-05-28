#!/usr/bin/env bash

set e+x

export DOCKER_BUILDKIT=1
LOCAL_NAME=skippednote/drupal-cypress:1.0.1

echo "Building $LOCAL_NAME"
docker build \
    -t $LOCAL_NAME \
    --build-arg DRUPALBASE_VERSION=php7.4 \
    --build-arg NODE_VERSION=14.x \
    --build-arg CYPRESS_VERSION=4.7.0 \
    --build-arg LIGHTHOUSE_VERSION=0.4.x .