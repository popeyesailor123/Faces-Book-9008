#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

readonly IP=${1:-localhost}
readonly CURL_LOG="/tmp/curl-${FACES_BOOK_PORT}.log"

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

curl_route()
{
  local ROUTE=$1
  echo "cURLing... http://${IP}:${FACES_BOOK_PORT}${ROUTE}"
  curl -i -f -X GET "http://${IP}:${FACES_BOOK_PORT}${ROUTE}" &> ${CURL_LOG}
  status=$?
  if [ "${status}" -eq "0" ]; then
    echo "PASS ${status} ${ROUTE}"
  else
    echo "FAIL ${status} ${ROUTE}"
    cat ${CURL_LOG}
    ${MY_DIR}/logs.sh
    exit ${status}
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

echo "faces-book: Running unit tests..."
curl_route "/test"
curl_route "/identity"

echo "faces-book: Checking routes are 200..."
curl_route "/"
curl_route "/index"
curl_route "/years"
curl_route "/faces?year=2017"
curl_route "/faces?year=2018"
curl_route "/shuffle?year=2017" && grep -q Shravan ${CURL_LOG}
curl_route "/shuffle?year=2018" && grep -q Varsha  ${CURL_LOG}
