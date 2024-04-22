# Shutdown (Hardware-)PBS after certain time
Shutdown PBS after 5:00 if additionally 5 minutes are gone. This 5 minutes are reset if a new task started in this period.
- Create all three files
  - /etc/systemd/system/autoshutdown.timer
  - /etc/systemd/system/autoshutdown.service
  - /scripts/autoshutdown.sh
- `chmod +x /scripts/autoshutdown.sh`
- `systemctl daemon-reload`
- `systemctl enable --now autoshutdown.timer`
