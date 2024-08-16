#!/bin/bash

#####################################################
# Update PiHole as LXC if tagged with "apptag_pihole"
#####################################################

App="Update all PiHole instances"

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_root
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do pihole=0 && containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct config $container | grep -q "apptag_pihole" && echo "Pihole: true" && pihole=1 || echo "Pihole: false" &&\
    if [ $pihole -eq 1 ]; then pct exec $container -- bash -c "sudo pihole -up"; fi
    echo ---; done
