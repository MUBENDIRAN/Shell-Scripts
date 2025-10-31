#!/bin/bash

#THIS IS A NETWORK CHECK SCRIPT

HOST="google.com"
FILE="/var/log/network_check.log"

if [ ! -f "$FILE" ]; then 
    sudo touch "$FILE"
fi

if ping -c 1 "$HOST" &> /dev/null 
then
    echo "$(date) $HOST is reachable " | sudo tee -a "$FILE"
else
    echo "$(date) $HOST is not reachable" | sudo tee -a "$FILE"
fi