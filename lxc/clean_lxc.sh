#!/bin/bash

###########
# Clean LXC
###########

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    echo "Purging and autoclean apt" &&\
    pct exec $container -- bash -c "apt-get -y --purge autoremove && apt-get -y autoclean" &&\
    pct exec $container -- bash <(curl -fsSL https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/clean.sh) &&\
    echo "Cleaning /var/lib/apt/lists/" &&\
    pct exec $container -- bash -c "rm -rf /var/lib/apt/lists/* && apt-get update" &&\
    echo ---; done
