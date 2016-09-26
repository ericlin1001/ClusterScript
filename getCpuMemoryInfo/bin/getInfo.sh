#!/bin/bash
#Author:Ericlin
#Get the CPU usage.

#name
s1=`hostname`

#Cpu Usage
s2=`top -bn2 -p1|fgrep "Cpu(s)"|tail -1|awk -F'id,' -v prefix="Cpu Usage:" '{n=split($1,vs,",");v=vs[n];sub("%","",v);printf "%s%.1f%%\n",prefix,100-v;}'`

#Type of Cpu
s3=`cat /proc/cpuinfo |grep name|head -n 1`
s3=${s3:12}

#Cores of Cpu
s4=`cat /proc/cpuinfo|grep cores|head -n 1`

#the time when runing it.
s5=`date`
echo $s1"|"$s2"|"$s3"|"$s4"|"$s5"|"
exit 0

