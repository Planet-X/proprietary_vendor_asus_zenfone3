#!/system/bin/sh

enable=`getprop persist.asus.onofftest.enable`
type=`getprop persist.asus.onofftest.type`
counter=`getprop persist.asus.onofftest.counter`
#echo "$counter"
numbers=`getprop persist.asus.onofftest.numbers`
delay=`getprop persist.asus.onofftest.delay`
x1=`getprop persist.asus.onofftest.x1`
y1=`getprop persist.asus.onofftest.y1`
x2=`getprop persist.asus.onofftest.x2`
y2=`getprop persist.asus.onofftest.y2`

if [ $enable -eq 1 ]; then
	if [ $type -eq 1 ]; then
		#echo "   <<======= On / Off stress test =======>"
		if [ $counter -le $numbers ]; then
			sleep $delay	

			counter=$(($counter +1))
			setprop persist.asus.onofftest.counter $counter
			echo " " >> /mnt/sdcard/onoff_test.txt
			echo "============================" >> /mnt/sdcard/onoff_test.txt
			echo "on off++++counter: $counter " >> /mnt/sdcard/onoff_test.txt
			echo "============================" >> /mnt/sdcard/onoff_test.txt

			sendevent /dev/input/event0 1 116 1
			sendevent /dev/input/event0 0 0 0
			sleep 0.5                          
			sendevent /dev/input/event0 1 116 0
			sendevent /dev/input/event0 0 0 0

			input tap $x1 $y1

			sleep 0.1
			input tap $x2 $y2
		fi
	elif [ $type -eq 2 ]; then
		#echo "   <<======= Restart stress test =======>"
		if [ $counter -le $numbers ]; then
			sleep $delay

			counter=$(($counter +1))
			setprop persist.asus.onofftest.counter $counter
			echo " " >> /mnt/sdcard/restart_test.txt
			echo "============================" >> /mnt/sdcard/restart_test.txt
			echo "Restart++++counter: $counter " >> /mnt/sdcard/restart_test.txt
			echo "============================" >> /mnt/sdcard/restart_test.txt

			sendevent /dev/input/event0 1 116 1
			sendevent /dev/input/event0 0 0 0
			sleep 0.5                          
			sendevent /dev/input/event0 1 116 0
			sendevent /dev/input/event0 0 0 0

			input tap $x1 $y1

			sleep 0.1
			input tap $x2 $y2
		fi
	fi
fi

