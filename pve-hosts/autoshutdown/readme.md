# Shutdown pve-host if one/some VM/LXC are stopped
Shutdown pve-host if VM 109 and LXC 112 are stopped. This script is looped every 300 seconds.

## Install Script with all dependencies
Create and jump to the directory like
```
mkdir -p /scripts
cd /scripts
```
then execute:
```
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/pve-hosts/autoshutdown/install | bash
```
