#!/bin/bash

#################################################################
# Install my needed packages on LXC if tagged with "apptag_tools"
#################################################################

App="Install standard tools on all LXC"

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do tools=0 && containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct config $container | grep -q "apptag_tools" && echo "Tools: true" && tools=1 || echo "Tools: false" &&\
    if [ $tools -eq 1 ]; then pct exec $container -- bash -c "apt-get update"; fi
    if [ $tools -eq 1 ]; then pct exec $container -- bash -c "DEBIAN_FRONTEND=noninteractive apt-get install curl mc htop sudo net-tools nano wget -y"; fi
    echo ---; done
