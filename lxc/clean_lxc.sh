#!/bin/bash

###########
App="Clean LXC"
###########

# Search for main.func primarily localy else source it from the web
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if [ -f $DIR/../main.func ]; then
  echo -e "Use local source"
  source "$DIR/../main.func"
else
  echo -e "Use web source"
  source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)
fi

header_info
func_app_title
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct exec $container -- bash -c "apt-get -y --purge autoremove && apt-get -y autoclean && bash <(curl -fsSL https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/clean.sh) && rm -rf /var/lib/apt/lists/* && apt-get update"    
    echo ---; done
