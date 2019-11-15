#!/bin/bash

if [ ! -e "Dockerfile" ]; then
    echo "Invalid directory! Dockerfile not found!"
    exit 1
fi

set -ex

IMAGE_NAME=${IMAGE_NAME:="davidlor/duckdns"}
IMAGE_TAG=${IMAGE_TAG:="dev"}
docker build . -t "${IMAGE_NAME}:${IMAGE_TAG}"
