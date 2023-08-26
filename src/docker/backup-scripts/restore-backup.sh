#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for restoring a backup.
#
# HOW TO USE THIS SCRIPT
#   docker ps -aq | xargs docker stop | xargs docker rm
#   docker volume ls -q | xargs docker volume rm
#   cd nsustain.com/src/docker
#
#   # Initialize the volumes with a clean plate.
#   # Exit when initialization is complete.
#   docker compose up
#
#   cd ./backup-scripts
#   ./restore-backup.sh ./backups/<filename>.tar.gz
#
#   # Run a shell inside the flarum container.
#   cd ../
#   docker compose exec -it flarum /bin/sh
#
#   # Upgrade flarum to the latest version.
#   # Source:
#   #   https://docs.flarum.org/update/#general-steps
#   composer update --prefer-dist --no-plugins --no-dev -a --with-all-dependencies
#   php flarum migrate
#   php flarum cache:clear
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

set -x
docker compose --profile nsustain-restore-backup up -d

# Copy the backup file to the container.
NSUSTAIN_BACKUP_BASENAME=$(basename ${NSUSTAIN_BACKUP_LOCATION})
docker compose --profile nsustain-restore-backup \
    exec nsustain-restore-backup /bin/sh -c \
    "mkdir -p /backups"
docker compose --profile nsustain-restore-backup \
    cp ${NSUSTAIN_BACKUP_LOCATION} \
    nsustain-restore-backup:/backups/${NSUSTAIN_BACKUP_BASENAME}

# Restore the backup files.
echo "[INFO] Extracting the backup files and applying them..."
docker compose exec nsustain-restore-backup /bin/sh -c \
    "tar xvf /backups/${NSUSTAIN_BACKUP_BASENAME} -C /"

docker compose --profile nsustain-restore-backup down
