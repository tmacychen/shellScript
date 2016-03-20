#!/bin/bash
# tput sc 存储光标位置
# 每次循环，我们回复之前存储的光标位置在终端输出 tput sc
# 新的count的值
# 恢复光标位置是tput rc
# tput ed 清除当前光标到行尾的内容

echo -n "Count:"
tput sc

count=0
while true
do
    if [ $count -lt 5 ];
    then let count++;
        sleep 1;
        tput rc
        tput ed
        echo -n $count;
    else
        exit 0;
    fi
done


