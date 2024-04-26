healthstate_openhab=$(curl -s 'https://healthchecks.io/b/2/0e244c1e-5235-4f4a-8ce0-3a3fa3437eaa.json' | jq -r '.status' | grep up)

if [ "$healthstate_openhab" == "up" ]; then
  echo -e "Everything fine! Service seems to be up."
elif
  if [ "$healthstate_openhab" == "" ]; then
    echo -e "Nothing found! Is your internet or healthchecks.io down?"
  fi
fi
