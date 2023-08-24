#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for backing up the website.
#
# PREREQUISITES
#   sudo gpg --full-generate-key
#
# HOW TO USE THIS SCRIPT
#   cd nsustain.com/src/docker/optional
#   sudo ./backup.sh
# ---------------------------------------------------------------------

mkdir -p ./backups

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
    ls -lh"
cd ./optional/backups
sudo docker compose cp flarum:/backups/flarum.tar.gz ./flarum.tar.gz

#
# Create a backup of the mariadb image.
#
cd ../../
sudo docker compose exec mariadb bash -c "mkdir -p /backups && \
    cd /backups && \
    tar czf mariadb.tar.gz \
    /var/lib/mysql && \
    ls -lh"
cd ./optional/backups
sudo docker compose cp mariadb:/backups/mariadb.tar.gz ./mariadb.tar.gz

#
# Combine flarum and mariadb backups into one.
#
BACKUP_DATE=$(date +'%Y%m%d')
tar czf ${BACKUP_DATE}.tar.gz ./flarum.tar.gz ./mariadb.tar.gz
sudo shred --remove ./flarum.tar.gz ./mariadb.tar.gz
ls -lh ${BACKUP_DATE}.tar.gz
