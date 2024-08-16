#!/usr/bin/env bash

echo -e "\n Cleaning /var/cache/"
cache=$(find /var/cache/ -type f)
if [[ -z "$cache" ]]; then
  echo -e "${Color_Red}It appears there are no cached files on your system${Color_NC} \n"
  sleep 2
else
  find /var/cache -type f -delete
  echo -e "${Color_Green}Successfully Removed Cache${Color_NC} \n"
  sleep 2
fi

echo -e "Cleaning /var/log/"
logs=$(find /var/log/ -type f)
if [[ -z "$logs" ]]; then
  echo -e "${Color_Red}It appears there are no logs on your system${Color_NC} \n"
  sleep 2
else
  find /var/log -type f -delete
  echo -e "${Color_Green}Successfully Removed Logs${Color_NC} \n"
  sleep 2
fi
