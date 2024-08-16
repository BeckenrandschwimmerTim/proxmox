#!/usr/bin/env bash

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

echo -e "${Color_Green}Cleaning /var/cache/${Color_NC}"
cache=$(find /var/cache/ -type f)
if [[ -z "$cache" ]]; then
  echo -e "${Color_Green}It appears there are no cached files on your system${Color_NC} \n"
  sleep 2
else
  find /var/cache -type f -delete
  echo -e "${Color_Green}Successfully Removed Cache${Color_NC} \n"
  sleep 2
fi

echo -e "${Color_Green}Cleaning /var/log/${Color_NC}"
logs=$(find /var/log/ -type f)
if [[ -z "$logs" ]]; then
  echo -e "${Color_Green}It appears there are no logs on your system${Color_NC} \n"
  sleep 2
else
  find /var/log -type f -delete
  echo -e "${Color_Green}Successfully Removed Logs${Color_NC} \n"
  sleep 2
fi
