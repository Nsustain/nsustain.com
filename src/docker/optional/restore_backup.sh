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

cd ./backups
tar xvf ${NSUSTAIN_BACKUP_LOCATION}

cd ../../
sudo docker compose cp ./optional/backups/flarum.tar.gz flarum:/backups/flarum.tar.gz
sudo docker compose exec flarum bash -c "tar xvf /backups/flarum.tar.gz -C /"

sudo docker compose cp ./optional/backups/mariadb.tar.gz mariadb:/backups/mariadb.tar.gz
sudo docker compose exec mariadb bash -c "tar xvf /backups/mariadb.tar.gz -C /"

cd ./optional/backups
sudo rm -f ./flarum.tar.gz ./mariadb.tar.gz
