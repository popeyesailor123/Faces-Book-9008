#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Remove docker images"
docker rmi ${FACES_BOOK_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}
