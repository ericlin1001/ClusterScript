#!/bin/bash
#Author:Ericlin(4633222898@qq.com)
#Date:Mon Sep 26 14:19:19 CST 2016

f=$1  ##read file
sf=$2 ##save file
cw=$(cd `dirname $0`;pwd)
bin=$cw"/bin"
cw=`pwd`
if [ -z "$f" ];then
    echo "Usage: genMachinefile.sh cpufile"
    exit 0;
fi

if [ -z "$sf" ];then
    sf=$f."machinefile"
fi
echo sf:$sf
###
cp $f $bin
cd $bin &&./genMachinefile.sh $f
cp $bin/$f".machinefile" $cw"/"$sf
rm $bin/*.machinefile >/dev/null 2>&1
echo "****Machinefile has been save in "[$cw"/"$sf"]******"
