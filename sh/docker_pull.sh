#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Pull the docker image from the repository"
docker pull ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}
