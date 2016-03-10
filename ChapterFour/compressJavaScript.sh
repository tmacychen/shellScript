#!/bin/bash
#压缩javascript需要的工作
#1.移除换行符和制表符
#2.压缩空格
#3.替换注释
#4.替换
#   "{ "替换为“{”
#   " }"       "}"
#   同理()
#   ", "      ","
#    " ; "    ";"

#要解压缩或者恢复可读性
#用";\n" 替换";"
#用"{\n" 替换"{","\n}"替换"}"

if test $# -ne 1
then
    echo "Usage : $0 javascript file"
fi

file=$1
echo "source file:"
echo "******************"

cat $file 

#移除'\n' '\t'
#tr -d '\n\t'
#移除多余空格
#tr -s ' '
#or
#sed 's/ \+/ /g'
#移除注释/***aaa***/
#sed 's:/\*.*\*/::g'
#移除多余空格
#sed 's/ \?\([{ }();,:]\) \?/\1/g'
# \?可以匹配可能出现在字符集前后的空格
echo "After compress"
echo "******************"
cat $file | tr -d '\n\t' | tr -s ' ' | sed 's:/\*.*\*/::g'| \
    sed 's/ \?\([{}();,:]\) \?/\1/g' > sample_compressed.js

cat sample_compressed.js
echo "decomprss  *******"
#恢复可读
cat sample_compressed.js | sed 's/;/;\n/g;s/{/{\n\n/g;s/}/}\n\n/g'

