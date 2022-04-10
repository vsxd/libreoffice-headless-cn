#!/usr/bin/env bash

# do local build
docker build --platform linux/amd64 -f ./Dockerfile -t vsxd/libreoffice-headless-cn:latest