# Clean all LXC
Clean all Proxmox LXC.

## Install/Update Script with all dependencies
Create and jump to the directory like
```
mkdir -p /scripts
cd /scripts
```
then execute:
```
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/lxc/clean_lxc/clean_lxc.sh | bash
```

## Execute without updating it from the web (if already installed)
Execute this on pve-host:
```
clean_lxc
```
