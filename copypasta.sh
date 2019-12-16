#!/bin/bash
#Copy paste someone's code!! xD

cat $1 | sed s/'^[[:blank:]]*<name\(.*\)val=".*"\(.*\)>'/"<name\1val=\"$2\"\2>"/g > out.txt
rm $1
mv out.txt $1