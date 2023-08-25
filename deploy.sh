#!/bin/bash

# Variables

servers="web01 web02 web03"

remote_dir="/var/www/html"


# Check if index.html exists locally

if [ -f "index.html" ]; then
    # Loop through servers and deploy index.html
    for server in "${servers[@]}"; do
        echo "Deploying index.html to $server..."
        
        # Copy index.html to remote server
        scp "index.html" "$server:$remote_dir"
        
        echo "Deployment to $server completed."
    done
    
    echo "Deployment process completed."
else
    echo "Error: index.html file not found locally."
    exit 1
fi
