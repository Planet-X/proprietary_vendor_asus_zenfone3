#!/system/bin/sh
echo "ASDF: Check LastShutdown log." > /proc/asusevtlog
echo get_asdf_log > /proc/asusdebug
