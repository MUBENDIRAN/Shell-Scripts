#!/bin/bash

# THIS IS A AUTO PROCESS WATCHDOG SCRIPT

PROCESS="daily_backup_monitor.sh"
LOGFILE="/home/mubiii/backup/watchdog.log"

if pgrep -f "$PROCESS" > /dev/null
then 
    echo " $(date) $PROCESS is running " >> "$LOGFILE"
else
    echo " $(date) $PROCESS is not running " >> "$LOGFILE"
    /home/mubiii/scripts/$PROCESS
fi