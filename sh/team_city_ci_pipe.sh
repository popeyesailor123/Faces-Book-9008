#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

${MY_DIR}/docker_build.sh
${MY_DIR}/docker_tag.sh
${MY_DIR}/docker_push.sh
${MY_DIR}/docker_clean.sh

