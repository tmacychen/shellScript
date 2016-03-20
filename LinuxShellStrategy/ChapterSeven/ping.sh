#!/bin/bash
#可以使用fping程序替代此程序
#-a 指定打印所有活动主机的ip
#-u 指定打印所有无法到达的主机
#-g 指定使用IP/mask的模式，或者起始ip到终止ip的模式
#例如：fping -a 192.168.1/24 -g 
# fping -a 192.168.0 192.168.0.255 -g
#可以使用 2>/dev/null  参数将无法到达的错误信息打印到/dev/null设备
#fping 的-d选项，可以利用DNS查询主机名

pre_addr=`ifconfig | egrep -o "inet 192.[0-9.]*" | egrep -o "[0-9.]*" | cut -c -12`

for ip in "$pre_addr"{0..255}
do 
    ping $ip -c 2 &> /dev/null

    if test $? -eq 0
    then
        echo $ip is alive
    fi
done

