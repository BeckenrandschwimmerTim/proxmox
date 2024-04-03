#!/bin/bash

###########
# Clean LXC
###########

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct exec $container -- bash -c "apt-get -y --purge autoremove && apt-get -y autoclean"; fi
    pct exec $container -- bash <(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/clean.sh); fi
    pct exec $container -- bash -c "rm -rf /var/lib/apt/lists/* && apt-get updaten"; fi
    echo ---; done
