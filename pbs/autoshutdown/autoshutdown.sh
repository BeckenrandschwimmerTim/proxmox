#!/bin/bash

#Count of times we have queried and there are tasks running
count=0
#Number of no-task intervals before we shutdown
max=30
#Interval in seconds
interval=10


#Continue until we shutdown
while true; do
    #Check if we should shutdown until we see not 
    if [[ $(proxmox-backup-manager task list) ]]; then
        #Continue to wait
        count=0
    else
        #There are no tasks running, so increment counter
        count=$((count + 1))
        echo "No tasks running, time until shutdown is $(((max - count) * interval)) seconds"
        #If we reached the max count, then shutdown
        if  ((count >= max)); then
            echo "Time to shutdown!"
            shutdown now
        fi
    fi
    #Delay by interval to next check
    sleep "$interval"
done
echo "Exiting"
