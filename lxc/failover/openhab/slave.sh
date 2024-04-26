# Check health state of master
healthstate=$(curl -s 'https://healthchecks.io/b/2/0e244c1e-5235-4f4a-8ce0-3a3fa3437eaa.json' | jq -r '.status' | grep up)

echo -e "Everything fine! Service seems to be up."
curl -m 10 --retry 5 https://hc-ping.com/3bd1985a-1267-422e-83a9-a4776d01b881
