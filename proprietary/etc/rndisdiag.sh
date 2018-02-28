#!/system/bin/sh
LOG_TAG="RNDIS_DIAG_SH"
/system/bin/log -t $LOG_TAG -p e "Start rndisdiag +++"
sleep 5
service call connectivity 30 i32 1
/system/bin/log -t $LOG_TAG -p e "Start rndisdiag ---"
