# Shutdown pve-host if one/some VM/LXC are stopped
Shutdown pve-host if VM 109 and LXC 112 are stopped. This script is looped every 300 seconds.
- Create all three files
  - `mkdir -p /scripts`
  - `nano /scripts/autoshutdown.sh`
  - `nano /etc/systemd/system/autoshutdown.timer`
  - `nano /etc/systemd/system/autoshutdown.service`
- `chmod +x /scripts/autoshutdown.sh`
- `systemctl daemon-reload`
- `systemctl enable --now autoshutdown.timer`
- `systemctl status autoshutdown.timer`
