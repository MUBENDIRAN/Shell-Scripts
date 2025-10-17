#!/bin/bash

# THIS IS A CLEANUP OF TEMPORARY FILES SCRIPT

DIR="/tmp"
FILE="/var/log/cleanup_tmp.log"
DAY=7

echo "The tmp file cleaning has started at $(date)" | sudo tee -a "$FILE"

for dir in "$DIR"; do
   echo "Checking in $dir" | sudo tee -a "$FILE"
         sudo find "$dir" -type f -mtime +$DAY -exec rm -f {} \; | while read filepath; do 
         echo " deleted : $filepath " | sudo tee -a "$FILE"
         done
       done

echo "The tmp file cleaning is complete at $(date)" | sudo tee -a "$FILE"
          
