# Shutdown (Hardware-)PBS after certain time
Shutdown PBS after 5:00 if additionally 5 minutes are gone. This 5 minutes are reset if a new task started in this period.

## Install Script with all dependencies
Create and jump to the directory like
```
mkdir -p /scripts
cd /scripts
```
then execute:
```
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/pbs/autoshutdown/install | bash
```
