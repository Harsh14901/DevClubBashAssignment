#!/bin/bash
#Script to return Full name from username

if [ ! -r $1 ]
then
    exit -1
fi

egrep -n "^.*:x:[[:digit:]]*:[[:digit:]]*:.*:.*:.*$" $1 > out.txt
egrep -n ".*" $1 > out_sam.txt

val3=$(cmp out.txt out_sam.txt | wc -c)
rm out.txt out_sam.txt
if [ $# != 2 -o $val3 != 0 ]
then
    exit -1
fi



echo $(grep "^$2:" $1 | tr ':' '\n' | sed -n "5"p)