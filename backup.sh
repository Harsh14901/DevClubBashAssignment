#!/bin/bash
#Syncs two folders!!
function generate_paths()
{
    find $1 -name "*" -type f > temp.txt
    len=$(echo $1 | wc -c)
    cut --complement -b 1-$len temp.txt > paths_$2.txt
    rm temp.txt   
}

generate_paths $1 1
generate_paths $2 2

diff paths_1.txt paths_2.txt > diff.txt

from1_2=$(egrep "^<" diff.txt | cut --complement -b 1-2)
from2_1=$(egrep "^>" diff.txt | cut --complement -b 1-2)
rm paths_1.txt paths_2.txt diff.txt

echo "Files copied from $1 to $2:"
for file in $from1_2
do
    echo $file
    cp "$1/$file" "$2/$file"
done

echo "Files copied from $2 to $1:"
for file in $from2_1
do
    echo $file
    cp "$2/$file" "$1/$file"
done

