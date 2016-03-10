#!/bin/bash

if test $# -ne 1
then
    echo $0 basepath;
    echo
fi
path=$1
echo $path

#声明一个数组变量
declare -A statarry;

while read line;
do
    ftype=`file -b $line | cut -d, -f1`
    let statarry["$ftype"]++;

done< <(find $path -type f)

echo =========file types and counts =============

#显示所有的key值
#echo ${!statarry[@]} 

for ftype in "${!statarry[@]}"
do
    echo $ftype: ${statarry["$ftype"]}
done

