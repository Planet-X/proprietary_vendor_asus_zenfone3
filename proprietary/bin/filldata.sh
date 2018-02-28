#!/system/bin/sh
test=/sdcard/fill_test
fsrc=/system/etc
i=0
j=0
k=0
cnt=0

rm -r ${test}
sleep 2
mkdir ${test} 

# repeat to fill data with small file
function filldata(){

    cp ${fsrc}/nand_sd_mmc_5K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_10K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_14K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_19K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_24K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_29K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_54K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_60K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_87K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_200K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_768K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_1024K ${test}/${i}_${j}
    j=`expr ${j} \+ 1`
    cp ${fsrc}/nand_sd_mmc_1234K ${test}/${i}_${j}

    # delete file randomly
    k=`expr ${k} \+ 3`
    k=`expr ${k} \% 13`
    rm ${test}/${i}_${k}
    # echo "rm ${test}/${i}_${k}"

    j=0
    i=`expr ${i} \+ 1`

    used=$(busybox df -P /data/ | grep userdata | awk '{ print $5}' | cut -d'%' -f1)
    # echo "data used: ${used}"
    if [ ${used} -ge 97 ]; then
        cnt=`expr ${cnt} \+ 1`
        echo "filldata with cnt:${cnt}" >> /sdcard/filldata_cnt.txt
        date >> /sdcard/filldata_cnt.txt
        setprop persist.filldata.cnt ${cnt}

        rm -r ${test}
        sleep 2
        mkdir ${test}
    fi	
}

loop=`getprop persist.filldata.loop`

if [ ${loop} -gt 0 ]; then
    for i in `seq 1 ${loop}`
    do
#        echo "run filldata with ${loop} times"
        filldata
    done
else
    while true
    do
#        echo "run filldata with endless loop times"
        filldata
    done
fi

exit 0
