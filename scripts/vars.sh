#!/bin/bash

#
# Contains variables used by other scripts.
#

WEB_CONTAINER_NAME=front

WEB_CONTAINER_ID=$(docker-compose ps -q ${WEB_CONTAINER_NAME})

WEB_CONTAINER_PROJECT_DIR="/var/www"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
