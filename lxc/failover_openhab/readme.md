# Failover Check for OpenHAB
Failover Check for OpenHAB.

## Install Script with all dependencies
Create and jump to the directory like
```
mkdir -p /scripts
cd /scripts
```
For MASTER execute:
```
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/lxc/failover_openhab/install_failover_openhab_master | bash
```
For SLAVE execute:
```
wget -O - https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/lxc/failover_openhab/install_failover_openhab_slave | bash
```
