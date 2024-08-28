#!/bin/bash
export PBS_REPOSITORY=<API-TOKEN>@<IP-OF-PBS>:<NAME-OF-DATASTORE> #API-TOKEN has to be owner of existing host-backups!
export PBS_PASSWORD=<API-TOKEN-PW>
export PBS_FINGERPRINT=<FINGERPRINT-OF-PBS>

export PBS_REPOSITORY
export PBS_PASSWORD
export PBS_FINGERPRINT

proxmox-backup-client backup root.pxar:/ --include-dev /etc/pve --exclude /var/log --exclude /mnt --exclude /tmp
