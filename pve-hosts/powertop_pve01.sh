#geht ohne freeze:
echo "powersave" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

#- alles mit wakeon lan
#- alle enable sata power management
#- vm write back
#- nmi watchdog
#- runtime pm for ata ...

#Wahrscheinlich Probleme:
