#!/usr/bin/env bash

echo -e "Cleaning /var/cache/"
cache=$(find /var/cache/ -type f)
if [[ -z "$cache" ]]; then
  echo -e "It appears there are no cached files on your system"
  sleep 2
else
  find /var/cache -type f -delete
  echo -e "Successfully Removed Cache \n"
  sleep 2
fi

echo -e "Cleaning /var/log/"
logs=$(find /var/log/ -type f)
if [[ -z "$logs" ]]; then
  echo -e "It appears there are no logs on your system"
  sleep 2
else
  find /var/log -type f -delete
  echo -e "Successfully Removed Logs \n"
  sleep 2
fi
