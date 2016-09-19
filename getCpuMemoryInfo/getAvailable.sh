#!/bin/bash
IFS=$'\n'
file=$1
if [ -z $file ];then
	file=machinefile.all.info
fi
rm i3 i5 i7 2>/dev/null
for i in $(cat $file) ; do
	name=`echo $i|awk -F'|' '{print $1}'`
	cpuUsage=`echo $i|awk -F'|' '{print $2}'|awk -F':' '{print $2}'|awk -F'.' '{print $1}'`
    cpuType=`echo $i|awk -F'|' '{print $3}'|awk '{print $3}'|awk -F'-' '{print $1}'`
    summary="|"$name"|"$cpuUsage"|"$cpuType"|"
    #echo $summary

	if test $cpuUsage -le 5
	then
        echo $summary>>$cpuType
        unused=1
	fi
done
cat i3 i5 i7
rm i3 i5 i7

