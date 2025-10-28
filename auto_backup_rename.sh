#!/bin/bash

#THIS IS A AUTOMATE BACKUP AND BATCH RENAMING SCRIPT WITH CRON

SOURCE="/var/log/"
DEST="/home/mubiii/backup"

echo " the backup has started $(date)"

tar -czf "$DEST.tar.gz" "$SOURCE"

echo " the backup has complete "

count=1
for file in "$DEST".tar.gz; do
    mv "$file" "$DEST/backup_${count}.tar.gz"
    ((count++))
done

echo "renaming to done "