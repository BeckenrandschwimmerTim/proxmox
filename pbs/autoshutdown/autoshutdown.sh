#!/bin/bash

count=0
max=30
interval=10

while true; do
    if [[ $(proxmox-backup-manager task list) ]]; then
        count=0
    else
        count=$((count + 1))
        echo "No tasks running, time until shutdown is $(((max - count) * interval)) seconds"
        if  ((count >= max)); then
            echo "Time to shutdown!"
            shutdown now
        fi
    fi
    sleep "$interval"
done
echo "Exiting"
