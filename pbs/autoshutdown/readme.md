# Shutdown (Hardware-)PBS after certain time
Shutdown PBS after 5:00 if additionally 5 minutes are gone. This 5 minutes are reset if a new task started in this period.
- Create all three files
- `chmod +x /usr/local/bin/autoshutdown`
- `systemctl daemon-reload`
- `systemctl enable --now autoshutdown.timer`
