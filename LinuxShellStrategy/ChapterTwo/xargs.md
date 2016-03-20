#xargs

xargs用来将stdin中的数据转换为特定命令的命令行参数

xargs 应该紧跟在管道操作符之后，它以标准输入作为主要的数据源
使用stdin并提供命令行参数来执行其他命令

command | xargs

##将多行输入转换为单行输出

利用xargs将多行文本的"\n"用空格进行替换

`cat abc.txt | xargs`

##将单行输入转换为多行输出

指定每行最大的参数数量n，我们可以将来自stdin的文本划分为多行
每行n个参数

`cat example.txt | xargs -n 3`

##输入指定一个定制的定界符
-d 选项可以为输入指定一个定制的定界符

`echo "dfadsfdaffasfd" | xargs -d s`

##从stdin中读取参数，传递给命令

假设参数是存放在arg.txt中，我们将参数传递给命令

每次使用一个参数
`cat args.txt | xargs -n 1 ./command.sh`
每次使用X个参数：`cat args.txt | xargs -n X ./command.sh `

可以指定一个参数模式，其中包括了固定参数，以及变化的参数

`cat args.txt | xargs -I {} ./command.sh -p {} -l`

输出例如：

> -p arg1 -l
> -p arg2 -l 
> -p arg3 -l

-I {} 指定了替换字符串，对每个命令参数，字符串{} 会被从stdin读取到
的参数所替换。


##与find想结合

`find . -type f -name "*.txt" -print | xargs rm -f`
这样做很危险，有时候会删除不应该删除的文件。有很多文件名中间会包含空格符。
xargs会误认为他们是定界符，例如hello world.txt，会认为hello和world.txt

只要我们把find的输出作为xargs的输入，就必须将print0与find结合
`find . -type f -name "*.txt" -print0 | xargs -0 rm -f`

统计C源码的行数

`find source_path -type f -name "*.c" -print0 | xargs -0 wc -l`







