#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for backing up the website.
#
# PREREQUISITES
#   gpg --full-generate-key
#
# HOW TO USE THIS SCRIPT
#   ssh <name>@<server IP>
#   mkdir -p ~/backups/20230823
#   cd ~/backups/20230823
#   tar xvf ./20230823.tar.gz
#   cp ~/git/nsustain.com/src/docker/optional/backup.sh
#   ./backup.sh
# ---------------------------------------------------------------------

mkdir -p ./optional/backups

#
# Create a backup of the flarum image.
#
cd ../
sudo docker compose exec flarum bash -c "mkdir -p /backups && \
    cd /backups && \
    tar czf flarum.tar.gz \
    /var/www/html/flarum \
    /etc/nginx \
    /etc/letsencrypt \
    /var/lib/letsencrypt && \
    ls -l"
cd ./optional/backups
sudo docker compose cp flarum:/backups/flarum.tar.gz ./flarum.tar.gz

#
# Create a backup of the mariadb image.
#
cd ../
sudo docker compose exec mariadb bash -c "mkdir -p /backups && \
    cd /backups && \
    tar czf mariadb.tar.gz \
    /var/lib/mysql && \
    ls -l"
cd ./optional/backups
sudo docker compose cp mariadb:/backups/mariadb.tar.gz ./mariadb.tar.gz

#
# Combine flarum and mariadb backups into one.
#
BACKUP_DATE=$(date +'%Y%m%d')
tar czf ${BACKUP_DATE}.tar.gz ./flarum.tar.gz ./mariadb.tar.gz

#
# Encrypt.
#
gpg --encrypt --recipient $(whoami) ./${BACKUP_DATE}
sudo shred --remove ${BACKUP_DATE}.tar.gz ./flarum.tar.gz ./mariadb.tar.gz