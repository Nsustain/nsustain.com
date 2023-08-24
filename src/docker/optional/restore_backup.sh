#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for restoring a backup.
#
# HOW TO USE THIS SCRIPT
#   cd nsustain.com/src/docker/optional
#   sudo ./restore_backup.sh
# ---------------------------------------------------------------------

NSUSTAIN_BACKUP_LOCATION=$1

if [ -z ${NSUSTAIN_BACKUP_LOCATION} ]; then
    echo "Usuage: ./restore_backup.sh <backup file>"
    exit 1
fi

if ! [ -f ${NSUSTAIN_BACKUP_LOCATION} ]; then
    echo "ERROR: ${NSUSTAIN_BACKUP_LOCATION} doesn't exist."
    exit 1
fi

#
# Decrypt.
#
gpg ${NSUSTAIN_BACKUP_LOCATION}


# tar xvf flarum.tar.gz -C /
#
# mkdir -p ./backups
#
# #
# # Create a backup of the flarum image.
# #
# cd ../
# sudo docker compose exec flarum bash -c "mkdir -p /backups && \
#     cd /backups && \
#     tar czf flarum.tar.gz \
#     /var/www/html/flarum \
#     /etc/nginx \
#     /etc/letsencrypt \
#     /var/lib/letsencrypt && \
#     ls -l"
# cd ./optional/backups
# sudo docker compose cp flarum:/backups/flarum.tar.gz ./flarum.tar.gz
#
# #
# # Create a backup of the mariadb image.
# #
# cd ../../
# sudo docker compose exec mariadb bash -c "mkdir -p /backups && \
#     cd /backups && \
#     tar czf mariadb.tar.gz \
#     /var/lib/mysql && \
#     ls -l"
# cd ./optional/backups
# sudo docker compose cp mariadb:/backups/mariadb.tar.gz ./mariadb.tar.gz
#
# #
# # Combine flarum and mariadb backups into one.
# #
# BACKUP_DATE=$(date +'%Y%m%d')
# tar czf ${BACKUP_DATE}.tar.gz ./flarum.tar.gz ./mariadb.tar.gz
#
# #
# # Encrypt.
# #
# gpg --encrypt --recipient $(whoami) ./${BACKUP_DATE}.tar.gz
# sudo shred --remove ${BACKUP_DATE}.tar.gz ./flarum.tar.gz ./mariadb.tar.gz
# ls -l ${BACKUP_DATE}.tar.gz.gpg
