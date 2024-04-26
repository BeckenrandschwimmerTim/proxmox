#!/bin/bash

master_check="https://hc-ping.com/3bd1985a-1267-422e-83a9-a4776d01b881"
master_name="openhab-master"

master_state=$(pct list | grep $master_name | grep running | awk '{print $1}')
if [ -z "$master_state" ]; then
  echo -e "Everything fine! Service seems to be up."
  curl -m 10 --retry 5 $master_check
fi
