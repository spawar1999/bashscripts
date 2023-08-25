#!/bin/bash

utilization_threshold=90   
        
#Current CPU utilization percentage

cpu_utilization=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

echo "Current CPU utilization: $cpu_utilization%"

if ((cpu_utilization > utilization_threshold)); then
    read -p "CPU utilization is high. Do you want to reboot the server? (yes/no): " choice

    if [[ "$choice" == "yes" || "$choice" == "Yes" || "$choice" == "YES" ]]; then
        echo "Rebooting the server..."
        sudo reboot
    elif [[ "$choice" == "no" || "$choice" == "No" || "$choice" == "NO" ]]; then
        echo "Server will not be rebooted."
    else
        echo "Invalid choice. Server will not be rebooted."
    fi
else
    echo "CPU utilization is within limits. No action needed."
fi

