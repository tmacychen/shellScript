#!/bin/bash

#IFS(internal Field Separator)，是shell中的内部字段分隔符

echo "first example"

data="name,sex,rollno,sec,min"
echo $data
oldIFS=$IFS
echo "IFS : ,now."
IFS=,now.

for item in $data;
do
    echo Item:$item
done
IFS=$oldIFS;

line="root:x:0:0:root:/root:/bin/bash"
oldIFS=$IFS
IFS=":"
echo $line
count=0
for item in $line
do
    [ $count -eq 0 ] && user=$item
    [ $count -eq 6 ] && shell=$item
    let count++
done
IFS=$oldIFS
echo "$user's shell is $shell";

