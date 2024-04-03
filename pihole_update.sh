#!/bin/bash

clear
for container in $(pct list | awk '{if(NR>1) print $1}'); do pihole=0 && containername=$(pct exec "$container" hostname) &&\
    echo "CT: $container - $containername" &&\
    pct config $container | grep -q "apptag_pihole" && echo "Pihole: true" && pihole=1 || echo "Pihole: false" &&\
    if [ $pihole -eq 1 ]; then pct exec $container -- bash -c "sudo pihole -up"; fi
    echo ---; done
