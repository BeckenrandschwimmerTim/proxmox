#!/bin/bash

cache=$(find /var/cache/ -type f)
if [[ -z "$cache" ]]; then
  echo -e "It appears there are no cached files on your system. \n"
  sleep 2
else
  find /var/cache -type f -delete
  echo "Successfully Removed Cache"
  sleep 2
fi

logs=$(find /var/log/ -type f)
if [[ -z "$logs" ]]; then
  echo -e "It appears there are no logs on your system. \n"
  sleep 2
else
  find /var/log -type f -delete
  echo "Successfully Removed Logs"
  sleep 2
fi
