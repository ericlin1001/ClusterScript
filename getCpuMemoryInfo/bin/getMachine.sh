#!/bin/bash
f=$1
t=$2
#number of cores
n=$3
savefile=$4
fc=$f".c"
fnc=$f".nc"
ch=0
step=1
echo "Get from file:$f type:$t number:$n"
if test $n -le 0;then
    exit 0;
fi
if [ "$t" = "i3" ];then
    step=2
elif [ "$t" = "i5" ];then
    step=4
elif [ "$t" = "i7" ];then
    step=4
else
    exit 1
fi

rm $fc $fnc 2>/dev/null
for i in $(cat $f) 
do
    nn=`echo $i|awk -F'|' '{print $2}'`
    tt=`echo $i|awk -F'|' '{print $4}'`
    ch=0
    if [ "$tt" = "$t" ];then
        if test $n -ge 1; then
            ch=1
            n=$(( $n-$step ))
        fi
    fi
    if test $ch -eq 1;then
        if test $n -ge 0; then
            echo $nn":$step">>$fc
        else
            k=$(( $n+$step ))
            echo $nn":$k">>$fc
        fi
    else
        echo $i>>$fnc
    fi
done
if test $n -le 0 ;then
    #Success.
    cp $fnc $f
    cat $fc
    cat $fc>>$savefile
    rm $fc $fnc 2>/dev/null
    exit 0
else
    rm $fc $fnc 2>/dev/null
    echo "Fails"
    exit 1
fi



