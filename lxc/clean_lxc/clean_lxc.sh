#!/bin/bash

App="Clean LXC"

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_root
func_check_if_proxmox

for container in $(pct list | grep running | awk '{print $1}'); do
    containername=$(pct exec "$container" hostname) &&\
    echo -e "Container: $container - $containername" &&\
    echo -e "Cleaning up logs, Autoclean apt-get, ..." &&\
    pct exec $container -- bash -c "apt-get -y --purge autoremove && apt-get -y autoclean && bash <(curl -fsSL https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/clean.sh) && rm -rf /var/lib/apt/lists/* && apt-get update"
    pct exec $container -- bash -c "docker image prune -a -f >/dev/null 2>&1"
    echo ---; done
