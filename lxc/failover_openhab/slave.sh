#!/bin/bash

# Check health state of master
healthstate=$(curl -s 'https://healthchecks.io/b/2/0e244c1e-5235-4f4a-8ce0-3a3fa3437eaa.json' | jq -r '.status' | grep down)

if [ "$healthstate" == "up" ]; then
  echo -e "Everything fine! Service seems to be up."
  elif [ "$healthstate" == "" ]; then
    echo -e "Nothing found! Is your internet or healthecks.io down?"
    elif [ "$healthstate" == "down" ]; then
      echo -e "Master is down! Starting or keeping slave."
      curl -m 10 --retry 5 https://hc-ping.com/7c0ae1f0-e9de-4f9b-b0bf-9eb284f1e479
      # Doing stuff
    fi
  fi
fi
