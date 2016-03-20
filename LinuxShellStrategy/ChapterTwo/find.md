#录制与回放

script 和 scriptreplay

#文件查找

##查看当前目录中的内容

```shell
find . -print
```

-print是表示以'\n'为分隔文件的定界符
-print0 表示以'\0'为分隔文件的定界符

```shell
find /home/tmacy -name "*.txt" -print
```

-name 指定了文件名必须匹配的字符串

-iname 表示忽略大小写

如果想匹配多个条件中的一个，可以采用OR

```shell
find . \(-name "*.txt" -o name "*.pdf" \) -print
```

-path 可以使用通配符来匹配文件路径或文件，-name总是用给定
的文件名进行匹配。

-regex 使用正则表达式来匹配

-maxdepth 指定搜索的最大深度
-mindepth 指定搜索的最小深度,查找并打印那些距离起始路径超过一定深度
的所有文件

-type 根据文件类型搜索 ：d 目录 f 文件 l 链接 c 字符设备 b 块设备 s 套接字
 p FIFO

 -atime -mtime -ctime 访问时间，修改时间，创建时间

 ```shell
 find . -type f -atime -7 -print
 ```
 打印最近七天内被访问过的所有文件

 ```shell
 find . -type f -atime 7 -print
 ```
 打印恰好在七天前访问过的所有文件

 ```shell
 find . -type f -atime +7 -print
 ```
 打印访问时间超过七天的所有文件

 -amin -mmin -cmin 按照分钟计算的时间

 -newer 找出比参考文件更新的所文件

 ```shell
 find . -type -f -newer file.txt -print
 ```
##基于文件大小来搜索

 ```
 find . -type f -size +2k
 #搜索大于2k的文件
 ```
 ```
 find . -type f -size -2k
 #搜索小于2k的文件
 ```
 ```
 find . -type f -size 2k
 #搜索等于2k的文件
 ```
除了k,还用b (块),c(字节),w(字),k(千字),m(兆),G

删除匹配文件：-delete

删除当前目录下所有的.swp文件

`find . -type f -name "*.swp" -delete`

##基于文件权限和所有权

`find . -type f -perm 644 -print`
找出web服务器上设置好执行权限的php文件
`find . -type f -name "*.php" | -perm 644 -print`

找出某个特定用户所拥有的文件

`find . -type f -user USER -print`

##执行命令行和动作

将某位用户的全部文件的所有权改成另一个用户
`find . -type f -user root -exec chown deepin {} \;`
在这个命令中，{}是一个特殊字符串，与-exec结合使用，对每个匹配的文件
{}会被替换为相应的文件名

将给定的所有C程序文件拼接起来，写入单个文件all_c_files.txt
`find . -type f -name "*.c" -exec cat {} \; > all_c_files.txt`

将10天前的txt文件复制到old目录中
`find . -type f -mtime +10 -name "*.txt" -exec cp {} old \;`

执行一个脚本
`find . -type f -name "*.txt" -exec ./command.sh {} \;`

与printf 结合生成有用的信息

`find . -type f -name "*.txt" -exec printf "Text fiel :%s\n" {} \;`

##让find跳过特定的目录

搜索时，有些目录是需要跳过的,例如.git目录

`find devel/source_path \( -name ".git" -prune \) -o \( -type f -print\)`

这里的-prune 用于进行排除，指明.git目录应该进行排除
-type f -print 是要执行的动作，要放在第二个语句块中。



