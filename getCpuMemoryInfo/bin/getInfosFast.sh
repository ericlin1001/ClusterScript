#!/bin/bash
#Edited by EricLin
#Finished: Thu Sep 15 15:49:04 CST 2016
filename=$1
pids=""
if [ -z $1 ];then
    filename=machinefile.all
fi
cur=`pwd`
savefile=$filename".info"
rm $savefile
rm ./tmp/*
cmd="$cur/getInfo.sh >$cur/tmp/"'`hostname` &'
echo cmd=$cmd
for line in $(cat $filename)
do 
    timeout -s9 3s ssh $line "$cmd"   &
    pid=$!;
    pids+=" $pid"
    pidToName[$pid]="$line"
done
echo 'Waiting for results(5 seconds)'
for p in $pids; do
    wait $p;
    res=$?;
    name=${pidToName[$p]};
    
    if [ $res -eq 124 ];then
        echo "Timeout:"$name
    elif [ $res -eq 0 ]; then
        echo "OK:"$name
    else
        echo "Error:"$name

    fi
done
sleep 1
cat ./tmp/* >>$savefile

