#!/bin/bash

#利用（）来给定义一个独立的shell
#当前shell是不会显示()中的内容
pwd;
(cd /bin ls);
pwd;

cat array.sh

out=$(cat array.sh)
echo $out

#read 用法

echo 读取5个字符串到var
read -n 5 var
echo "var :"$var

echo 按照密码方式读取
read -s var
echo "var :"$var

echo 带有提示的读取
read -p "enter input:" var
echo "var :"$var

echo 设定时限的读取3秒
read -t 3 var
echo "var :"$var


