#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Build the image"
docker build \
  --build-arg REPO_URL=$(git config --get remote.origin.url) \
  --build-arg REPO_SHA=$(git rev-parse HEAD) \
  --tag ${FACES_BOOK_IMAGE} \
    ${MY_DIR}/../app

echo "Tag the image"
docker tag \
  ${FACES_BOOK_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

echo "Push the image to the repository"
docker push \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

echo "Remove the local images"
docker rmi ${FACES_BOOK_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

