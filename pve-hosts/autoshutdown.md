# Create Script
```
mkdir -p /scripts
nano /scripts/autoshutdown.sh
```
```
#!/bin/bash

file02_running=$(qm list | grep -q file02 && echo "true" || echo "false")

if [ "$file02_running" == "false" ]; then
	echo -e "Initiate shutdown"
	sleep 5
	#shutdown
else
	echo -e "VM still running. Do nothing"
	sleep 5
fi
```
# Create Service
```
nano /etc/systemd/system/autoshutdown.service
```
```
[Unit]
Description=Autoshutdown

[Service]
Type=oneshot
ExecStart=/bin/bash /scripts/autoshutdown.sh
```
# Create Timer
```
nano /etc/systemd/system/autoshutdown.timer
```
```
[Unit]
Description=Autoshutdown

[Timer]
OnUnitActiveSec=300s
OnBootSec=300s

[Install]
WantedBy=timers.target
```
# Start the script chain
```
chmod +x /scripts/autoshutdown.sh
systemctl daemon-reload
systemctl enable autoshutdown.timer
systemctl start autoshutdown.timer
```
