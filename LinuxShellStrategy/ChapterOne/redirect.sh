#!/bin/bash

echo "this is a example text" > tmp.txt
cat tmp.txt
echo "this is the append line" >> tmp.txt
cat tmp.txt

echo "dele tmp"
rm -i tmp.txt

#重定向错误流和输出流 

ls + 2>stderr.txt 1>stdout.txt

#or
#将stderr转换成stdout，使得stderr和stdout都被重定向到同一个文件
#ls a  2>&1 output.txt

echo "下面代码，tee接收到来自stdin的数据，将stdout的一份副本写入文件out.txt
同时将另一份副本作为后续命令的stdin。命令cat -n，将从stdin中接收到每一行加入行号输出到stdout"

cat a* | tee out.txt | cat -n

#默认情况下，tee会将文件覆盖，-a选项可以追加内容
# cat a* | tee -a out.txt | cat -n

#让命令从文件中读取

#cmd < file

#用脚本写入文件
#
#cat <<EOF>log.txt
#LOG FILE
#this is a test log file
#EOF
# 在cat <<EOF>log.txt 与下一个EOF之间所有文本行都会当作stdin的数据

#自定义文件描述符
#使用一次后就不能再用

echo this is a test file > input.txt
exec 3<input.txt

cat <& 3

exec 4> output.txt

echo newline >& 4
cat output.txt
exec 5>>output.txt
echo apppended line >&5
cat output.txt




