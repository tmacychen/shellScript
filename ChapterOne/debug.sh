#!/bin/bash 

# _DEBUG=on ./debug.sh 会显示DEBUG的信息 
#$@ 将所有参数依次扩展
function DEBUG()
{
    [ "$_DEBUG" == "on" ] && $@ || :
}


for i in {1..10}
do
    set +x
    echo $i
    DEBUG echo $i
    set +x
done
echo "Script executed"
