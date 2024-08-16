#!/bin/bash

App="Clean LXC"

# Eval script dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Source main.func for func_check_if_root and func_check_if_proxmox
source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)
func_check_if_root
func_check_if_proxmox

# After func_check_if_proxmox was successfully, continue ...
mkdir -p $DIR/misc
cd $DIR/misc
curl https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func -o main.func
source $DIR/misc/main.func

header_info
#func_check_if_proxmox
func_app_title

for container in $(pct list | grep running | awk '{print $1}'); do
    containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct exec $container -- bash -c "apt-get -y --purge autoremove && apt-get -y autoclean && bash <(curl -fsSL https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/clean.sh) && rm -rf /var/lib/apt/lists/* && apt-get update"
    pct exec $container -- bash -c "docker image prune -a -f >/dev/null 2>&1"
    echo ---; done
