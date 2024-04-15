#!/bin/bash

###########################################################
App="Set CPU Scaling Governor to Powersave (UNTIL REBOOT!)"
###########################################################

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
echo $App
func_line

echo -e "All Cores are now in ..."
echo "powersave" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
