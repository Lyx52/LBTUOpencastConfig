#!/bin/bash
mkdir data

OPENCAST_REPO=https://github.com/opencast/opencast.git
OPENCAST_VERSION=13.6
FFMPEG_VERSION=latest
IMAGE_TAG=13.6
IMAGE_TAG_MAJOR=13
OPENCAST_DISTRIBUTION=allinone
GIT_COMMIT=$(git rev-parse --short HEAD || echo "unknown")
BUILD_DATE=$(date -u +"%Y-%m-%dT%TZ")

# build variables (do not change)

export DOCKER_BUILDKIT=1

# targets
docker build \
        --pull \
        --build-arg OPENCAST_REPO="$OPENCAST_REPO" \
        --build-arg OPENCAST_VERSION="$OPENCAST_VERSION" \
        --build-arg OPENCAST_DISTRIBUTION="$OPENCAST_DISTRIBUTION" \
        --build-arg FFMPEG_VERSION="$FFMPEG_VERSION" \
        --build-arg BUILD_DATE="$BUILD_DATE" \
        --build-arg GIT_COMMIT="$GIT_COMMIT" \
        --build-arg VERSION="$IMAGE_TAG" \
        -t "lbtu-opencast:latest" \
        $DOCKER_BUILD_ARGS \
        -f Dockerfile .