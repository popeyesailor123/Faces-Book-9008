#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"

${MY_DIR}/docker_build.sh
${MY_DIR}/container_down.sh
${MY_DIR}/container_up.sh
${MY_DIR}/ci_smoke_tests.sh
${MY_DIR}/container_down.sh
${MY_DIR}/docker_push.sh
${MY_DIR}/docker_clean.sh

