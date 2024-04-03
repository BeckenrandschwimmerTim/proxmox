#!/bin/bash

####################################################
Sync a datastore with another (here attached by USB)
####################################################

source <(curl -s https://raw.githubusercontent.com/BeckenrandschwimmerTim/proxmox/main/misc/main.func)

header_info
func_check_if_pbs

source_name="localbackupstorage"
source_prune_job="s-9fbd06a7-3249"
target_device="/dev/disk/by-id/usb-FIDECO_M203CPS_012345680503-0:0-part1"
target_name="usb-datastore"
target_dir="/mnt/usb-datastore"
target_prune_job="s-a7557d41-8c59"
target_verify_job="v-aba8e5f8-e05e"
target_sync_job="s-85756ee2-df40"

echo -e "Try to mount $target_dir with $target_device"
mkdir -p $target_dir
mount $target_device $target_dir

if [ -d $target_dir/.chunks ]; then
    echo -e "$target_dir mounted. Start job"
    sleep 5
    proxmox-backup-manager datastore update $target_name --delete maintenance-mode
    echo -e "----------------------------------------------------------"
    echo -e "Start pruning $source_name"
    sleep 5
    proxmox-backup-manager prune-job run $source_prune_job
    echo -e "----------------------------------------------------------"
    echo -e "Start garbage collection of $source_name"
    sleep 5
    proxmox-backup-manager garbage-collection start $source_name
    echo -e "----------------------------------------------------------"
    echo -e ""
    echo -e "Jobs on source are done. Continue with target..."
    echo -e ""
    echo -e "----------------------------------------------------------"
    echo -e "Start pruning $target_name"
    sleep 5
    proxmox-backup-manager prune-job run $target_prune_job
    echo -e "----------------------------------------------------------"
    echo -e "Start garbage collection of $target_name"
    sleep 5
    proxmox-backup-manager garbage-collection start $target_name
    echo -e "----------------------------------------------------------"
    echo -e "Start verify $target_name before sync"
    sleep 5
    proxmox-backup-manager verify-job run $target_verify_job
    echo -e "----------------------------------------------------------"
    echo -e "Start sync, by pulling from $source_name to $target_name"
    sleep 5
    proxmox-backup-manager sync-job run $target_sync_job
    echo -e "----------------------------------------------------------"
    echo -e "Job is done. Unmount and set to maintenance mode in 15 seconds ..."
    sleep 15
    proxmox-backup-manager datastore update $target_name --maintenance-mode offline
    umount -l $target_dir
    umount $target_dir
    sleep 5
    exit 0
else
    echo -e "$target_dir NOT found or mounted. Aborting"
    exit 1
fi
