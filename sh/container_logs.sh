#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Display the container log"
docker logs ${APP_CONTAINER}
