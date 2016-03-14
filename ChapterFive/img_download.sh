#!/bin/bash

_DEBUG="on"
#_DEBUG="off"

function DEBUG(){
 [ "$_DEBUG" == "on" ] && $@
}

if test $# -ne 3
then
    echo "Usage :$0 URL -d Directory"
    exit -1
fi

for i in {1..4}
do
    case $1 in
        -d) shift;directory=$1;shift;;
        *) url=${url:-$1};shift;;  #如果url没有值,设置为$1.如果有值,使用url的值
    esac
done

DEBUG echo $url,$directory;

mkdir -p $directory;
baseurl=$(echo $url | egrep -o "https?://[a-z0-9.]+");

DEBUG echo $baseurl;

curl -s $url | egrep -o "<img src=[^>]*>" | sed 's/<img src=\"\([^"]*\).*/\1/g' > /tmp/$$.list
#匹配<img src=",括号中[^"]表示匹配除了"的符号,后面的*表示匹配前面规则的多个符号
#DEBUG cat /tmp/$$.list

#sed -i "s|^/|$baseurl/|" /tmp/$$.list
#DEBUG cat /tmp/$$.list

cd $directory

while read filename
do
    echo "## downloading $filename"
    curl -s -O "$filename" 
done < /tmp/$$.list


