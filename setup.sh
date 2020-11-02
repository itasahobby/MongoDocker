#!/bin/bash

CONTAINER_NAME="web_db"
SERVICE_NAME="dockermongodb"
RUN_FILE="run_mongodb.sh"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
NAME_TAKEN=$(docker image ls | grep $CONTAINER_NAME | wc -l)

chmod +x "$DIR/$RUN_FILE"
cp "$DIR/$RUN_FILE" "/bin/$RUN_FILE"

if [ $NAME_TAKEN -gt 0 ] 
then
  echo "Image name already taken, rebuilding...";
  docker container stop "$CONTAINER_NAME"
  docker container rm "$CONTAINER_NAME"
  docker image rm "$CONTAINER_NAME"

else
  echo "Building...";
fi

docker build -t "$CONTAINER_NAME" "$DIR/docker"
cp "$DIR/dockermongodb.service" "/etc/systemd/system/$SERVICE_NAME.service"
chmod 644 "/etc/systemd/system/$SERVICE_NAME.service"
systemctl start "$SERVICE_NAME"
echo "Reloading units..."
systemctl daemon-reload