#!/system/bin/sh

DIR=/sdcard/fsstress-testing

if [ -d $DIR ]; then
	rm -r $DIR
fi
mkdir $DIR
rand=`expr $RANDOM \% 30`
rand=`expr ${rand} \+ 10`
sleep ${rand}
echo "fsstress start with rand:${rand}" >> /sdcard/fsstress_trace.txt
/system/bin/fsstress -d $DIR -p 4 -n 1000 -l0 -v

