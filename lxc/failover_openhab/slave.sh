#!/bin/bash

master_check="https://healthchecks.io/b/2/0e244c1e-5235-4f4a-8ce0-3a3fa3437eaa.json"
slave_name="openhab-slave"
slave_check="https://hc-ping.com/7c0ae1f0-e9de-4f9b-b0bf-9eb284f1e479"

# Check health state of master
healthstate=$(curl -s $master_check | jq -r '.status')

if [ "$healthstate" == "" ]; then
  echo -e "Nothing found! Is your internet or healthecks.io down?"
fi
if [ "$healthstate" == "up" ]; then
  echo -e "Master is up!"
  slave_state=$(pct list | grep $slave_name | awk '{print $1}')
  if [ "$slave_state" == "running" ]; then
    echo -e "Slave still running! Shuting it down."
    lxc-stop -n $slave_name
  else
    echo -e "Slave is down. Everything fine!"
  fi
fi
if [ "$healthstate" == "down" ]; then
  echo -e "Master is down! Starting or keeping slave."
  curl -m 10 --retry 5 $slave_check
  if [ "$slave_state" == "stopped" ]; then
    echo -e "Slave is down. Starting it!"
    lxc-start -n $slave_name
  fi
fi
