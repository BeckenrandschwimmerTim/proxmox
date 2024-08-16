# Clean all LXC
Clean all Proxmox LXC.

## Install/Update Script with all dependencies
Execute on a pve host (it will be checked by the very beginning):
```
# Create and jump to the scripts directory
mkdir -p /scripts
cd /scripts
# Execute the scripts
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/lxc/clean_lxc/clean_lxc.sh | bash
```
