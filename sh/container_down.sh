#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Bring down the docker container"
docker rm --force ${APP_CONTAINER} &> /dev/null || true
