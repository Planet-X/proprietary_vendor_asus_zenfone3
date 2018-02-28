#!/system/bin/sh
#[Setup log & env]

#echo "==========>[FT5X46] firmware automatic updata start!! >>>>>>>>>>>>>>>>>>" > /dev/console
echo "[Touch] touch fw_auto_update start !"
fw_PATH='/asusfw/touch'
device_PATH='/sys/bus/i2c/devices/i2c-3/3-0038/'

TP_ID=`cat $device_PATH/TP_ID`
HD_ID=`cat $device_PATH/HW_ID`
FT_ID=`cat $device_PATH/FT_ID`
Touch_IC_ID=`cat $device_PATH/Touch_IC_ID`
IC_init=`cat $device_PATH/ftinitstatus`
hardware_id=`getprop ro.hardware.id`

fw_id_now=`cat $device_PATH/ftstpfwver`
vd_id_now=`cat $device_PATH/tp_id_ic`
echo "[Touch] firmware TP_ID = $TP_ID ,version= $fw_id_now"
if [ "$IC_init" = "0" ];then
	echo "[Touch] touch IC init =0 fail! "
elif [ "$HD_ID" = "2" ] ;then
	if [ "$TP_ID" = "69" ];then
		fw_id_new=`cat $fw_PATH/GIS_CTC_1/fw_version`
		vd_id_new=`cat $fw_PATH/GIS_CTC_1/vd_version`
		image_new=`cat $fw_PATH/GIS_CTC_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "61" ] ;then
		fw_id_new=`cat $fw_PATH/GIS_TM_1/fw_version`
		vd_id_new=`cat $fw_PATH/GIS_TM_1/vd_version`
		image_new=`cat $fw_PATH/GIS_TM_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "74" ] ;then
		fw_id_new=`cat $fw_PATH/LCE_BOE_1/fw_version`
		vd_id_new=`cat $fw_PATH/LCE_BOE_1/vd_version`
		image_new=`cat $fw_PATH/LCE_BOE_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "43" ] ;then
		fw_id_new=`cat $fw_PATH/TOT_AUO_1/fw_version`
		vd_id_new=`cat $fw_PATH/TOT_AUO_1/vd_version`
		image_new=`cat $fw_PATH/TOT_AUO_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "34" ] ;then
		fw_id_new=`cat $fw_PATH/BIEL_BOE_1/fw_version`
		vd_id_new=`cat $fw_PATH/BIEL_BOE_1/vd_version`
		image_new=`cat $fw_PATH/BIEL_BOE_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "44" ] ;then
		fw_id_new=`cat $fw_PATH/TOT_BOE_1/fw_version`
		vd_id_new=`cat $fw_PATH/TOT_BOE_1/vd_version`
		image_new=`cat $fw_PATH/TOT_BOE_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "41" ] ;then
		fw_id_new=`cat $fw_PATH/TOT_TM_1/fw_version`
		vd_id_new=`cat $fw_PATH/TOT_TM_1/vd_version`
		image_new=`cat $fw_PATH/TOT_TM_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	elif [ "$TP_ID" = "31" ];then
		if [ "$FT_ID" = "2" ] ;then 
			echo "[Touch] LCDID = $FT_ID ,Leo(TM) 5.2"
			fw_id_new=`cat $fw_PATH/BIEL_TM_2/fw_version`
			vd_id_new=`cat $fw_PATH/BIEL_TM_2/vd_version`
			image_new=`cat $fw_PATH/BIEL_TM_2/name`
			echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
			if [ "$fw_id_now" = "$fw_id_new" ];then
				echo "[Touch] FW is new didn't upgrade!"
			else
				echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
				echo "[Touch] FW need upgrade!"
			fi
		elif [ "$FT_ID" = "3" ] ;then 
			echo "[Touch] LCDID = $FT_ID ,Libra(TM) 5.5"
			fw_id_new=`cat $fw_PATH/BIEL_TM_1/fw_version`
			vd_id_new=`cat $fw_PATH/BIEL_TM_1/vd_version`
			image_new=`cat $fw_PATH/BIEL_TM_1/name`
			echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
			if [ "$fw_id_now" = "$fw_id_new" ];then
				echo "[Touch] FW is new didn't upgrade!"
			else
				echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
				echo "[Touch] FW need upgrade!"
			fi
		fi
	elif [ "$TP_ID" = "39" ] ;then
		fw_id_new=`cat $fw_PATH/BIEL_CTC_1/fw_version`
		vd_id_new=`cat $fw_PATH/BIEL_CTC_1/vd_version`
		image_new=`cat $fw_PATH/BIEL_CTC_1/name`
		echo "[Touch] : FW in asusfw is $image_new - $vd_id_new - $fw_id_new"
		if [ "$fw_id_now" = "$fw_id_new" ];then
			echo "[Touch] FW is new didn't upgrade!"
		else
			echo $fw_PATH/$image_new > $device_PATH/ftsfwupgradeapp
			echo "[Touch] FW need upgrade!"
		fi
	
	else	
		echo "[Touch][fw-error]:TP_ID not in list didn't update touch fw!!"
	fi
	echo "[Touch] now TPID_fwver = $vd_id_now _ $fw_id_now "
	fw_id_new=`cat $device_PATH/ftstpfwver`
	echo "[Touch] new TPID_fwver = $vd_id_new _ $fw_id_new "

else	
	echo "[Touch][fw-error]:TP_ID not in list didn't update touch fw!!"
fi
