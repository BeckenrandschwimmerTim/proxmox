```
mkdir /scripts -p
nano /scripts/powertop.sh
```

```
#!/bin/bash

sleep 30

echo "powersave" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
/sbin/powertop --auto-tune
echo 'disabled' > '/sys/class/net/enp3s0/device/power/wakeup'
echo 'disabled' > '/sys/class/net/eno1/device/power/wakeup'
echo 'disabled' > '/sys/bus/usb/devices/usb1/power/wakeup'
echo 'disabled' > '/sys/bus/usb/devices/usb2/power/wakeup'
echo 'disabled' > '/sys/bus/usb/devices/1-4/power/wakeup'
echo 'disabled' > '/sys/bus/usb/devices/1-5/power/wakeup'
```

```
chmod +x /scripts/powertop.sh
```

`crontab -e`
`@reboot /scripts/powertop.sh`
