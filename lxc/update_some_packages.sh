#!/bin/bash

#######################################################################################
# Update only some packages on LXC if tagged with "apptag_auto_advanced_packaging_tool"
#######################################################################################

App="Update only some packages on all LXC with specific tag"

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_app_title
func_check_if_root
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do aptget=0 && containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct config $container | grep -q "apptag_auto_advanced_packaging_tool" && echo "Auto APT: true" && aptget=1 || echo "Auto APT: false" &&\
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt-get update"; fi
    #if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt list --upgradable"; fi
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "DEBIAN_FRONTEND=noninteractive apt-get install --only-upgrade qemu-* docker-* -y >/dev/null 2>&1"; fi
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt autoremove"; fi
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt-get clean"; fi
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt-get autoclean"; fi
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt-get clean"; fi
    if [ $aptget -eq 1 ]; then pct exec $container -- bash -c "apt autoremove"; fi
    echo ---; done
