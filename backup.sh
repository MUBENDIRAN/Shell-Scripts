#!/bin/bash

#THIS IS A LOG BACKUP SCRIPT

SOURCE="/var/log/"
DEST="/home/mubiii/backup/"

echo " ---- the back of log started at $(date) ---- "

sudo mv "$SOURCE"/* "$DEST"

echo " ---- the backup of log has finished at $(date) ---- "
