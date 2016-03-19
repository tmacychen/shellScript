#统计磁盘

##df和du

df与du是统计磁盘使用情况的重要命令，df是disk free的缩写，du是disk usage的
缩写。

##du

`du file.txt`

查看文件的大小，以字节为单位

`du -a directory`

获得某个目录的所有文件磁盘使用情况

-h 选项可以以更友好的格式进行打印
-c 选项可以输出作为命令参数的所有文件和目录的磁盘使用情况。会在最后有一个
总计

-s 只输出合计的数据

按照特定的单位打印文件

-b 以字节为单位打印（默认）
-k 以千字节为单位打印
-m 以mb打印
-B 以块为单位打印

可以利用通配符指定排除文件,不进行统计

`du --exclude "*.txt" files...` 指定排除txt文件

##找出目录中最大的10个文件

`du -ak source_dir | sort -nrk 1 | head`

-a 指定了所有的目录和文件

如果不想包括目录：
`find . -type f -exec du -k {} \; | sort -nrk 1 | head`

我们用find替 du将文件过滤出来，无需du本身递归

##df

df会提供磁盘使用的情况信息

`df -h`


