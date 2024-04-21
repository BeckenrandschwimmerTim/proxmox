#!/bin/bash

sleep 30

/sbin/powertop --auto-tune
echo 'disabled' > '/sys/class/net/enp2s0/device/power/wakeup'
echo 'disabled' > '/sys/bus/usb/devices/usb1/power/wakeup'
echo 'disabled' > '/sys/bus/usb/devices/usb2/power/wakeup'

#echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "powersave" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
#echo "ondemand" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
