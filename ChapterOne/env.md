#获取一个程序的进程ID，例如gedit
`pgrep gedit`

#对于每个进程，运行时的环境变量可以使用下面命令查看
`cat /proc/$PID/environ`

以上命令，会输出的环境变量以及对应值的列表
每个变量以name=value的形式描述
利用tr 命令，将\0 替换成\n，将输出重新格式化
`cat /proc/$PID/environ | tr '\0' '\n'`

#获取变量长度

`length=${#var}`
length 包含的是字符串的字符数

#获得当前shell版本
`echo $SHELL`
`echo $0`

#检查是否为超级用户

```shell
if [ $UID -ne 0 ];then
    echo Non root user.
else
    echo Root user
fi
```

#利用shell，执行数学运算

```
no1=4;
no2=5;
let res=no1+no2
#or
res=$[ no1 + no2 ]
#or
res=$(( no1 + 50 ))
#or
res=`expr 3 + 4`

#自增，自减

let no1++
let no2--
```
使用bc，做数学运算,支持浮点数

```
echo "4 * 0.46" | bc
```
设置浮点精度

` echo "scale=2;3/8" | bc `
进制转换

`echo "obase=2;$no|bc"`
将二进制转为十进制
```
no=1010101
echo "obase=10;ibase=2;$no"|bc
```
计算平方和平方根
`echo "sqrt(100)" | bc `
`echo "10^10" | bc `


