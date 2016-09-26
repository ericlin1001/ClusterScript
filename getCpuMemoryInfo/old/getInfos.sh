#!/bin/bash
#Edited by EricLin
#Finished: Thu Sep 15 15:49:04 CST 2016
filename=$1
if [ -z $1 ];then
    filename=machinefile
fi
cur=`pwd`
savefile=$filename".info"
cmd="$cur/getInfo.sh >>$cur/$savefile"
echo cmd=$cmd
for line in $(cat $filename)
do 
#echo checking machine:$line...;
ssh cluster@$line "hostname";
if [ "$?" -eq "0" ]; then
ssh cluster@$line "$cmd";
else
echo Error:$line 
fi
done
echo "Result are saved in file:"$savefile

