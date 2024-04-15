#!/bin/bash

##################################
# Install my needed apps and tools
##################################

parentdir="${PWD%/*}"
source $parentdir/misc/main.func

header_info
func_check_if_pbs

exit
