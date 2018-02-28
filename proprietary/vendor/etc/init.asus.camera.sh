#!/system/bin/sh

#ASUS_BSP +++ Deka "Disable qcom display lowpower when using camera"
target=`getprop camera.prop.command`
case "$target" in
    "disable-lowpower")
		service call display.qservice 16 i32 0
        ;;
    "enable-lowpower")
        service call display.qservice 16 i32 70
        ;;
    * )
    ;;
esac
#ASUS_BSP --- Deka "Disable qcom display lowpower when using camera"
