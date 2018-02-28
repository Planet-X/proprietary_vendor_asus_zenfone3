#!/system/bin/sh
SpeakerCalibrationTest 1> /dev/null 2>&1
if [ "$?" == "0" ]; then
    echo "pass"
else
    echo "fail"
fi
