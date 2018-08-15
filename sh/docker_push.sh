#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Push the docker image to the repository"
docker push \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
