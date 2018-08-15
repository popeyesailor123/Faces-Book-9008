#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Tag the docker image"
docker tag \
  ${APP_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
