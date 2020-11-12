#!/bin/sh

service cron start && /usr/local/bin/docker-entrypoint.sh mongod