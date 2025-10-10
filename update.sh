#!/bin/bash

#THIS IS AN AUTOMATE UPDATE AND LOG SCRIPT

LOGFILE="/var/log/system_update.log"

{
echo "-----The update has started $(date) -----" 

sudo apt-get update -y

sudo apt-get upgrade -y 

echo "-----the update has finished $(date) -----"
} >> "$LOGFILE" 2>&1

echo "THE SYSTEM UPDATE HAS DONE.CHECK FOR MORE DETAILS AT $LOGFILE"
