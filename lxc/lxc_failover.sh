healthstate=$(curl -s 'https://healthchecks.io/b/2/8543ba44-60ad-4c70-9a21-adcdd1d8bb9a.json' | jq -r '.status' | grep up)

if [ "$healthstate" == "" ] 
