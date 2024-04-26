healthstate=$(curl -s 'https://healthchecks.io/b/2/8543ba44-60ad-4c70-9a21-adcdd1d8bb9a.json' | jq -r '.status' | grep up)

if [ "$healthstate" == "" ]
  echo -e "Nothing found! Is your internet or healthchecks.io down?"
  exit 1
fi
if [ "$healthstate" == "up" ]
  echo -e "Everything fine! Service seems to be up."
  exit 0
fi
