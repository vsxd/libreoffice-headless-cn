#!/usr/bin/env bash

docker run --rm -it -v $(pwd):/tmp --name libreoffice-headless libreoffice-headless-cn:latest "$@"

if [ -d "./hsperfdata_root" ]; then
	rm -rf ./hsperfdata_root
fi