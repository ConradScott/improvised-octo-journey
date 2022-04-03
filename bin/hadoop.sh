#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

exec docker run -it --rm --init ioj-hadoop:latest
