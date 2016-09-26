#!/bin/bash
#Edited by EricLin
#Finished: Thu Sep 15 15:49:04 CST 2016
filename=$1
savefile=$filename".machinefile"
rm $savefile 2>/dev/null
#machinefile.all.info
cp ./machinefile.all tmp.all
allInfo="tmp.all.info"
./getInfosFast.sh tmp.all
tmp=tmp.ava
./getAvailable.sh $allInfo >$tmp
if [ -z $1 ];then
    filename="exp"
fi

echo "*******Generating Machinefile**********"
for line in $(cat $filename)
do 
    cpuType=`echo $line|awk -F':' '{print $1}'`
    num=`echo $line|awk -F':' '{print $2}'`
    ./getMachine.sh $tmp $cpuType $num $savefile
done
rm $tmp 2>/dev/null
#echo "Machinefile has been save in :`pwd`/$savefile"

