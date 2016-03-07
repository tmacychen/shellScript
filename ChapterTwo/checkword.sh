#!/bin/bash

#在/usr/share/dict/中包含了一些词典文件，我们可以用
#这个列表来检查单词是否是词典中的单词

word=$1

grep "^$1$" /usr/share/dict/* -q

if [ $? -eq 0 ] ;then
    echo $word is a dictionary word
else
    echo $word is not a dictionary word
fi
