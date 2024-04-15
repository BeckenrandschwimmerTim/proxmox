#!/bin/bash

#########################################################
# Set CPU Scaling Governor to Performance (UNTIL REBOOT!)
#########################################################

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

echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo -e "All Cores are now in ..."
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
