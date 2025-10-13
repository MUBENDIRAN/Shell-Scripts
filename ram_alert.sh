#!/bin/bash

#THIS IS A RAM USAGE ALERT SCRIPT 

FILE="/var/log/ram_usage.log"

echo " ----the ram usage check has started----$(date) "

if [ ! -f "$FILE" ]; then
	sudo touch /var/log/ram_usage.log
else
	free -m | awk '/^Mem/ { used=$3; total=$2; usage=(used/total)*100; 
		usage_int=int(usage);
		if (usage_int  > 80 ) 
		print strftime("%Y-%m-%d %H-%M-%S"), " the ram usage is high " >> "'$FILE'"
		else
		print strftime("%Y-%m-%d %H-%M-%S"), " usage of ram is optimal " >> "'$FILE'" }'
fi

echo " ----the ram usage check the finished for log check $FILE ------ $(date) " 
