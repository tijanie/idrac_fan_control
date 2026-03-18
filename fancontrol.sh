temp="$(ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 sdr type temperature | grep ^Temp | grep -vi disabled | awk -F'|' '{print $5}' | sed 's/^ *//' | awk '{print $1}')"
if ((temp < 60)); then
  ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 raw 0x30 0x30 0x02 0xff 0x14
  echo "Fan Speed = 20"
elif ((temp < 65)); then
  ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 raw 0x30 0x30 0x02 0xff 0x1E
  echo "Fan Speed = 30"
elif ((temp < 70)); then
  ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 raw 0x30 0x30 0x02 0xff 0x32
  echo "Fan Speed = 50"
elif ((temp < 75)); then
  ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 raw 0x30 0x30 0x02 0xff 0x46
  echo "Fan Speed = 70"
elif ((temp < 80)); then
  ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 raw 0x30 0x30 0x02 0xff 0x5A
  echo "Fan Speed = 90"
else
  ipmitool -I lanplus -U root -P LegioFulminata#8 -H 192.168.0.150 raw 0x30 0x30 0x02 0xff 0x64
  echo "Fan Speed = 100"
fi
