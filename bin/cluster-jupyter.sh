#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

# Don't use `--init` as this image uses `tini`
#
docker run -it --rm \
  --name ioj-jupyter \
  -v jupyter:/home/jovyan/work \
  --network ioj \
  -p 8888:8888/tcp \
  ioj-jupyter:latest
