#!/bin/bash

#THIS IS A LOG MONITOR SCRIPT

LOGFILE="/var/log/slimski.log"
REPORT="/home/mubiii/log_report.txt"

echo "Failed authentication for pam " >> $REPORT

sudo grep "fail" $LOGFILE >> $REPORT 

echo " the report saved to $REPORT "
