#!/bin/bash
set -ex

# This script (along with .env) are SCP'd onto
# the deployment VM into a unique folder/

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

${MY_DIR}/docker_pull.sh
${MY_DIR}/container_down.sh
${MY_DIR}/container_up.sh
${MY_DIR}/container_logs.sh
docker container ls
