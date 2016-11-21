#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${DIR}/vars.sh

if [ "$1" = "DROP" ] || [ "$1" = "CREATE" ]; then
  docker exec -it ${DB_CONTAINER_ID} mysql -uuser -ppassword -e "$1 DATABASE project_db"
else
  docker exec -i ${DB_CONTAINER_ID} mysql -uuser -ppassword project_db < $1
fi