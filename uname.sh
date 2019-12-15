#!/bin/bash
#Script to return Full name from username

egrep -n "^.*:x:[[:digit:]]*:[[:digit:]]*:.*:.*:.*$" $1 > out.txt
egrep -n ".*" $1 > out_sam.txt

val3=$(cmp out.txt out_sam.txt | wc -c)
if [ $# != 2 -o $val3 != 0 ]
then
    exit -1
fi
rm out.txt out_sam.txt


echo $(grep "^$2:" $1 | tr ':' '\n' | sed -n "5"p)