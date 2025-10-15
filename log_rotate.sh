#!/bin/bash

#THIS IS A LOG ROTATION SCRIPT

FILE="/var/log/syslog"
BACKUP="/var/log/backup_logs"
MAX_SIZE=1048576
DATE=$(date)

#sudo mkdir -p "$BACKUP"

FILE_SIZE=$(stat -c%s "$FILE" )

if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then 
	echo " the size of file is higher ($FILE_SIZE bytes ).Rotating ... " >> /var/log/rotation.log
	mv "$FILE" "$BACKUP/syslog_$DATE.log"
	touch "$FILE"
else 
	echo " the file size is optimal ($DATE)($FILE_SIZE) " >> /var/log/rotation.log
fi

