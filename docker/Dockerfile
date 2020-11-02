# docker build -t web_db .
FROM mongo:latest
LABEL maintainer="ITasahobby"

# Update repositories and install cron
RUN apt-get update && apt-get -y install cron

# Backup script
ADD backup_mongodb.sh /bin/backup_mongo.sh
RUN /usr/bin/chmod +x /bin/backup_mongo.sh
# Cron setup
ADD backup_crontab /etc/cron.d/backup_crontab
RUN /usr/bin/chmod 0644 /etc/cron.d/backup_crontab
RUN /usr/bin/crontab /etc/cron.d/backup_crontab
# Entrypoint
ADD run.sh /bin/run.sh
RUN /usr/bin/chmod +x /bin/run.sh

ENTRYPOINT [ "/bin/run.sh" ]