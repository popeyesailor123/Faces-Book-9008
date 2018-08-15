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

#echo "Bring down the current web-server"
#docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true
#docker container ls

#echo "Bring up the new web-server"
#docker run \
#  --detach \
#  --name ${FACES_BOOK_CONTAINER} \
#  --publish ${FACES_BOOK_PORT}:${FACES_BOOK_PORT} \
#  --env FACES_BOOK_PORT=${FACES_BOOK_PORT} \
#    ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

#echo "Crude wait for readyness"
#sleep 2
#docker container ls

#echo "Display the web-server logs"
#docker logs ${FACES_BOOK_CONTAINER}

echo "Simple sanity check"
readonly CURL_LOG="/tmp/curl-faces-book-${FACES_BOOK_PORT}.log"
curl -i -f -X GET "http://localhost:${FACES_BOOK_PORT}/" &> ${CURL_LOG}
cat ${CURL_LOG}
