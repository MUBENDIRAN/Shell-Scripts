#!/bin/bash

#THIS IS A CPU ALERT AND LOG SCRIPT

FILE="/var/log/cpu_alert.log"
DATE="$(date)"

echo " ---- the cpu check started--- $(date) "

if [ ! -f "$FILE" ]; then
	sudo touch cpu_alert.log
fi


PERCENTAGE=$( top -bn1 | grep "Cpu(s)" | awk '{ 100 - $8 }' | cut -d. -f1)

if [ $PERCENTAGE >  80 ]; then
 echo " the cpu usage is high  at $DATE " | sudo tee -a "$FILE"
else 
 echo " the cpu usage is optimal at $DATE " | sudo tee -a "$FILE"

fi
