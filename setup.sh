#!/bin/bash

CONTAINER_NAME="web_db"
SERVICE_NAME="dockermongodb"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
NAME_TAKEN=$(docker image ls | grep $CONTAINER_NAME | wc -l)

if [ $NAME_TAKEN -gt 0 ] 
then
  echo "Image name already taken";
else
  echo "Building...";
  docker build -t "$CONTAINER_NAME" "$DIR/docker"
  cp "$DIR/dockermongodb.service" "/etc/systemd/system/$SERVICE_NAME.service"
  chmod 644 "/etc/systemd/system/$SERVICE_NAME.service"
  systemctl start "$SERVICE_NAME"
fi