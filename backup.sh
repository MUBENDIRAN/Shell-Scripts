#!/bin/bash

#THIS IS A BACKUP SCRIPT 

BACKUP="/home/mubiii/backup"
SOURCE="/var/log"

if [ ! -d  $BACKUP ]; then
	mkdir $BACKUP
else
	sudo cp "$SOURCE"/*.log  "$BACKUP"
fi
echo "Backup of log have done in $BACKUP on $(date) "


