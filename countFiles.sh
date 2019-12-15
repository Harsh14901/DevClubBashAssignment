#!/bin/bash
#A script to count number of files in a directory but not its subdirectories
if [ ! -r $1 ] || [ ! -d $1 ]
then
    exit -1
fi
if [ $# -eq 2 ]
then
    ls -l $1 | grep -c "^[-].*$2$"
else
    ls -l $1 | grep -c "^[-].*$"
fi