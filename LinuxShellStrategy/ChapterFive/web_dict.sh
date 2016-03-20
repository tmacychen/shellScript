#!/bin/bash

#_DEBUG="on"
_DEBUG="off"

function DEBUG(){
 [ "$_DEBUG" == "on" ] && $@
}

if test $# -ne 1
then
    echo "Usage $0 word"
    exit -1
fi

word=$1
DEBUG echo the word is $1

curl -sS http://dict.youdao.com/w/$1/\#keyfrom\=dict.top > /tmp/$$.dict

grep -q "您要找的是不是" /tmp/$$.dict 

if [ $? -eq 0 ]
then
    echo "找不到该词的释义"
else 
    echo""
    cat /tmp/$$.dict | egrep "<li>[vnapc]+" | sed \
        "s#<li>\(.*\)</li>#\1#" | tr -s ' '
fi
