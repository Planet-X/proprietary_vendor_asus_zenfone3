temp=$(getprop persist.asus.dfps)

vndservice call display.qservice 36 i32 ${temp}
