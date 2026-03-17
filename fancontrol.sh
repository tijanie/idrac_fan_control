ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 sdr type temperature | grep ^Temp | grep -vi disabled | awk -F'|' '{print $5}' | sed 's/^ *//' | awk '{print $1}'
