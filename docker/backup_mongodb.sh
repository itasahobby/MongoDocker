#!/bin/sh

DATABASE_NAME="test"
BACKUP_LOCATION="/backups"
TIMESTAMP=$(date +%Y%m%d%H%M%S)

/usr/bin/mongodump --out /${BACKUP_LOCATION}/${TIMESTAMP} --db ${DATABASE_NAME}
