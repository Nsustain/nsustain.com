#!/bin/bash

# ---------------------------------------------------------------------
# This is a script we use for backing up the website.
#
# HOW TO USE THIS SCRIPT
#   scp ~/backups/20230823.tar.gz <name>@<server IP>:~/20230823.tar.gz
#   ssh <name>@<server IP>
#   mkdir -p ~/backups/20230823
#   cd ~/backups/20230823
#   tar xvf ./20230823.tar.gz
#   cp ~/git/nsustain.com/src/docker/optional/backup.sh
#   ./backup.sh
# ---------------------------------------------------------------------

#
#
#


tar xvf flarum.tar.gz -C /
