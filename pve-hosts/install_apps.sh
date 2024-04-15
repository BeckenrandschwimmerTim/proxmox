#!/bin/bash

##################################
# Install my needed apps and tools
##################################

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/../misc/main.func"

header_info

apt-get update
DEBIAN_FRONTEND=noninteractive  apt-get install mc htop curl powertop -y
