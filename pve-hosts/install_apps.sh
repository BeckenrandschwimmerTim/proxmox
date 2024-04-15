#!/bin/bash

##################################
# Install my needed apps and tools
##################################

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/..//misc/main.func"
#source ${PWD%/*}/misc/main.func

header_info
func_check_if_pbs

exit
