#!/bin/bash

######################################
App="Install my needed apps and tools"
######################################

# Eval script dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p $DIR/misc
cd $DIR/misc
curl https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func -o main.func
source $DIR/misc/main.func

header_info
func_app_title

func_check_if_proxmox

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install mc htop curl powertop acpi-support acpid acpi iperf3 sudo wget jq -y
