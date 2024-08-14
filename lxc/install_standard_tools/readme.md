# Install standard tools on all LXC
Install standard tools on all Proxmox LXC.

## Install/Update Script with all dependencies
Create and jump to the directory like
```
mkdir -p /scripts
cd /scripts
```
then execute:
```
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/lxc/install_standard_tools/install_standard_tools.sh | bash
```
