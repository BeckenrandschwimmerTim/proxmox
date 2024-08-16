#!/bin/bash

#######################################################################################
# Update all PortainerAgents of LXC if tagged with "apptag_portaineragent_as_docker_v1"
#######################################################################################

App="Update all PortainerAgents"

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_proxmox

for container in $(pct list | awk '{if(NR>1) print $1}'); do portaineragent_as_docker_v1=0 && containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct config $container | grep -q "apptag_portaineragent_as_docker_v1" && echo "portaineragent_as_docker_v1: true" && portaineragent_as_docker_v1=1 || echo "portaineragent_as_docker_v1: false" &&\
    if [ $portaineragent_as_docker_v1 -eq 1 ]; then pct exec $container -- bash -c "cd /sharedfolders/appdata/portainer-agent && docker compose pull && docker compose up -d"; fi
    echo ---; done
