#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

service ssh start
exec gosu hadoop "$@"
