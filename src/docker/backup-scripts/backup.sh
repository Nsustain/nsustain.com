#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for backing up the website.
#
# HOW TO USE THIS SCRIPT
#   cd nsustain.com/src/docker/backup-scripts
#   sudo ./backup.sh
# ---------------------------------------------------------------------

mkdir -p ./backups
docker compose --profile nsustain-backup build --no-cache
docker compose --profile nsustain-backup up
