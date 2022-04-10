#!/usr/bin/env bash

docker run --rm -it --platform linux/amd64 -v $(pwd):/tmp --name libreoffice-headless-cn vsxd/libreoffice-headless-cn:latest "$@"

if [ -d "./hsperfdata_root" ]; then
	rm -rf ./hsperfdata_root
fi