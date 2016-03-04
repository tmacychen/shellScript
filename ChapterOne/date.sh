#!/bin/bash
date

echo "1970-1-1 0:0:0到当前时刻的秒数"
date +%s

 #--date 用于提供日期串作为输入

 date --date "Jan 20 2015" +%A

#日期内容     |     格式
#
#星期               %a (例如 Sat)
#                   %A (例如 Saturday)
#                   
#月                 %b (例如Nov)
#                   %B (例如 November)
#日                 %d (例如：31) 
#固定格式           %D (例如：10/18/10)
#年                 %y (例如 10)
#                   %Y (例如：2010)
#小时               %I或%H(例如 08)
#分钟               %M(例如33)
#秒                 %S(例如10)
#纳秒               %N(例如34342)
#UNIX纪元           %s

#按照格式输出时间
date "+%d %B %Y"

#设置日期和时间
#date -s "21 June 2015 12:33:33"

echo "测试命令所花的时间"

start=$(date +%s)
sleep 3

end=$(date +%s)
difference=$(( end - start))
echo Time taken to exec commands is $difference seconds
