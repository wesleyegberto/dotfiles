#!/usr/bin/env bash
set -e errexit

docker build -t ubuntu/neovim .
docker run -it --rm ubuntu/neovim