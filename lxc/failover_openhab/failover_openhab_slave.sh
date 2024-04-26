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
  slave_state=$(pct list | grep $slave_name | grep running | awk '{print $1}')
  if [ ! -z "$slave_state" ]; then
    slave_id=$slave_state
    echo -e "Slave still running! Shuting it down."
    lxc-stop $slave_id
  else
    echo -e "Slave is down. Everything fine!"
  fi
fi
if [ "$healthstate" == "down" ]; then
  echo -e "Master is down! Starting or keeping slave."
  slave_state=$(pct list | grep $slave_name | grep stopped | awk '{print $1}')
  curl -m 10 --retry 5 $slave_check
  if [ ! -z "$slave_state" ]; then
    slave_id=$slave_state
    echo -e "Slave is down!"
    lxc-start $slave_id
  else
    echo -e "Starting slave!"
  fi
fi
