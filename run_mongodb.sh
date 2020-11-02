#!/bin/bash
/usr/bin/docker container start $1 2>/dev/null
if [ $? -eq 1 ]
then 
  /usr/bin/docker run -td -p 27017:27017 --name $1 -v /backups:/backups $1
fi