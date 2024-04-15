#!/bin/bash

##################################
# Install my needed apps and tools
##################################

# Search for main.func primarily localy else source it from the web
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if [ -f $DIR/../misc/main.func ]; then
  echo -e "Use local source"
  source "$DIR/../misc/main.func"
else
  echo -e "Use web source"
  source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)
fi

header_info

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install mc htop curl powertop acpi-support acpid acpi iperf3 wget -y
