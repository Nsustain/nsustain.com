#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for restoring a backup.
#
# HOW TO USE THIS SCRIPT
#   cd nsustain.com/src/docker/backup-scripts
#   sudo ./restore-backup.sh
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
