#!/system/bin/sh
gesture_type=`getprop persist.asus.gesture.type`
echo "$gesture_type" > /sys/bus/i2c/devices/i2c-3/3-0038/gesture_mode

