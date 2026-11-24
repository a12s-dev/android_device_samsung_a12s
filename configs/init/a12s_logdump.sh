#!/system/bin/sh
mkdir -p /cache/bringup /data/bringup
i=0
while [ $i -lt 10 ]; do
  sleep 25
  i=$((i+1))
  logcat -b all -d -v threadtime > /cache/bringup/logcat_$i.txt 2>&1
  dmesg > /cache/bringup/dmesg_$i.txt 2>&1
  cp /cache/bringup/logcat_$i.txt /data/bringup/logcat_$i.txt 2>/dev/null
  echo "A12S_DUMP_$i done" > /dev/kmsg
done
