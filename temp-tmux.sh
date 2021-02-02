echo `cat /sys/class/thermal/thermal_zone*/temp | sed 's/\(.\)..$/.\1°C/' | sed ':a;N;$!ba;s/\n/\//g'`
