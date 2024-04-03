#!/bin/bash

#########################################################
Update PiHole as LXC when its tagged with "apptag_pihole"
#########################################################

clear
if ! command -v pveversion >/dev/null 2>&1; then echo -e "⚠️  Has to be executed on Proxmox"; return 1 ; fi

for container in $(pct list | awk '{if(NR>1) print $1}'); do pihole=0 && containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct config $container | grep -q "apptag_pihole" && echo "Pihole: true" && pihole=1 || echo "Pihole: false" &&\
    if [ $pihole -eq 1 ]; then pct exec $container -- bash -c "sudo pihole -up"; fi
    echo ---; done
