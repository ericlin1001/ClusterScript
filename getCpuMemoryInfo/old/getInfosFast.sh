#!/bin/bash
#Edited by EricLin
#Finished: Thu Sep 15 15:49:04 CST 2016
filename=$1
if [ -z $1 ];then
    filename=machinefile
fi
cur=`pwd`
savefile=$filename".info"
rm $savefile
rm ./tmp/*
cmd="$cur/getInfo.sh >$cur/tmp/"'`hostname` &'
echo cmd=$cmd
for line in $(cat $filename)
do 
#echo checking machine:$line...;
#ssh cluster@$line "hostname";
timeout -s9 2s ssh $line "$cmd";
res=$?
if [ $res -eq 124 ];then
    echo "Timeout:$line"
else
    if [ $res -eq 0 ]; then
        echo OK:$line
    else
        echo Error:$line 
    fi
fi
done
echo 'Waiting for results(4 seconds)'
sleep 4
cat ./tmp/* >>$savefile
echo "Result are saved in file:"$savefile

