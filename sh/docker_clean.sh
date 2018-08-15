#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Remove docker images"
docker rmi ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
