#!/bin/bash

file02_stopped=$(qm status 109 | grep -q stopped && echo "true" || echo "false")
pbs_stopped=$(pct status 112 | grep -q stopped && echo "true" || echo "false")

if [ "$file02_stopped" == "true" ] && [ "$pbs_stopped" == "true" ]; then
	echo -e "Initiate shutdown"
	sleep 5
	shutdown
else
	echo -e "VM still running. Do nothing"
	sleep 5
fi
