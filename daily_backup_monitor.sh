#!/bin/bash

# THIS IS A AUTOMATIC BACKUP AND MONITORING SCRIPT USING CRON SHEDULING

SOURCE="/var/log/"
DEST="/home/mubiii/backup"
RAM="/var/log/ram_use.log"
DISK="/var/log/disk_use.log"
DATE=$(date)

echo " the daily backup and monitering is started $DATE "

cp "$SOURCE"/*.log "$DEST" 

echo " the backup completed " | tee -a "$DEST/backup.log"

df -h | awk -v date="$DATE"  'NR>1 && NF>2 {gsub("%"," ",$5);
 if ($5 > 80 )
	print " WARNING : "$1" is "$5" % full, date  " >>  "'$DISK'"
else
	print " the disk usage is normal ,date  " >>  "'$DISK'" }'

free -m | awk -v RAM_LOG="$RAM" -v date="$DATE"  '/^Mem:/ { used = $3; total = $2; usage = (used/total) *100;
 		usage_int = int(usage);
 		if (usage_int > 80)
 		print " the ram usage is high ,date " >>  RAM_LOG
 	else 
 		print " the ram usage is normal, date " >>  RAM_LOG  }'

 echo " the daily backup and monitering is done $DATE "











