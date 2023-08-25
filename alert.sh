#!/bin/bash

load_avg_threshold=4.0

email_recipient="spawar@securityhq.com"

load_avg=$(cat /proc/loadavg | awk '{print $1}')

if (( $(echo "$load_avg > $load_avg_threshold" | bc -l) )); then
    echo "High load average detected on $HOSTNAME is $load_avg" | mail -s "Server Alert" "$email_recipient"
fi

