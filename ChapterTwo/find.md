#录制与回放

script 和 scriptreplay

#文件查找

查看当前目录中的内容

```
find . -print
```

-print是表示以'\n'为分隔文件的定界符
-print0 表示以'\0'为分隔文件的定界符

```
find /home/tmacy -name "*.txt" -print
```

-name 指定了文件名必须匹配的字符串

-iname 表示忽略大小写

如果想匹配多个条件中的一个，可以采用OR

```
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

 ```
 find . -type f -atime -7 -print
 ```
 打印最近七天内被访问过的所有文件

 ```
 find . -type f -atime 7 -print
 ```
 打印恰好在七天前访问过的所有文件

 ```
 find . -type f -atime +7 -print
 ```
 打印访问时间超过七天的所有文件

 -amin -mmin -cmin 按照分钟计算的时间

 -newer 找出比参考文件更新的所文件

 ```
 find . -type -f -newer file.txt -print
 ```



