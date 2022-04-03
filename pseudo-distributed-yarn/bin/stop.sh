#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

mapred --daemon stop historyserver
stop-yarn.sh
stop-dfs.sh
