#!/bin/bash
#calci using shell

num=$(awk '{print $1}' $1)
operand=$(awk '{print $2}' $1)
len=$(echo $num | wc -w)
ans=0
for((i=1;i<=$len;i++));
do
    val=$(echo $num | cut -d " " -f $i)
    operator=$(echo "$operand" | sed -n "$i"p)
    case $operator in
        "+")
            ans=$(echo "scale=8;$ans+$val" | bc)
        ;;
        "-")
            ans=$(echo "scale=8;$ans-$val" | bc)
        ;;
        "*")
            ans=$(echo "scale=8;$ans*$val" | bc)
        ;;
        "/")
            ans=$(echo "scale=8;$ans/$val" | bc)
        ;;
    esac
    # echo $ans
done

printf "%.2f\n" $(echo $ans)
