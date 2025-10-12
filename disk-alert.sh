
#!/bin/bash


#THIS IS A DISK SPACE ALERT SCRIPT

THRESHOLD=80
FILE="/var/log/disk_log.log"

echo " ------The disk check at $(date)------"

if [ ! -f "$FILE" ]; then
	sudo touch "$FILE"
else
	df -h | awk -v threshold=$THRESHOLD 'NR>1 && NF>2 { gsub("%"," ",$5); if ($5 > threshold) 
	print "Warning: "$1" is "$5" % full" >> "'$FILE'" 
	else
	 print " the disk "$1" is "$5" % occupied no need to worry " >> "'$FILE'" }'
 
fi
