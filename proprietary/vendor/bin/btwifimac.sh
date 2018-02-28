setprop ro.btmac `btnvtool -x 2>&1`
wifi_mac=`sed -n '1 p' /factory/wifi.nv`
wifi_mac=${wifi_mac//MacAddress0=/ }
setprop ro.wifimac $wifi_mac
