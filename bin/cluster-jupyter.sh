#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

# Don't use `--init` as this image uses `tini`
#
docker run -it --rm -p 8888:8888/tcp -v jupyter:/home/jovyan/work --network ioj ioj-jupyter:latest
