#!/bin/bash

#THIS IS A AUTO MOUNT SCRIPT

MOUNT_POINT="/media/usb"

DEVICE=$(lsblk -o NAME,TYPE,RM | awk '$2=="part" && $3==1 {print "/dev/"$1;
exit}')
if [ -n "$DEVICE" ]; then
    sudo mkdir -p "$MOUNT_POINT"
    if mount | grep -q "$MOUNT_POINT"; then
        echo "the USB already mounted at $MOUNT_POINT "
    else 
        sudo mount "$DEVICE"  "$MOUNT_POINT" 
        echo " the mounted successfully "
    fi
else 
    echo " no USB Detected "
fi