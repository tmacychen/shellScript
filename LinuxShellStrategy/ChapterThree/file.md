#文件


##创建特定大小的文件

`dd if=/dev/zero of=tmp.data bs=1m count=1`

上面的命令会创建1m大小的文件，if表示输入文件，of表示输出文件，bs表示以字节为单位
的块大小（block size,BS)，count代表要复制的块数

bs为1,count=1 得到大小为1MB的文件。如果设置bs=2 count=2,得到总大小为4MB的文件

/dev/zero 是字符设备，会不断返回0值(\0)

不指定if参数，dd会从stdin中读取输入。不制定of参数，会从stdout中输出。

##文本文件的交集和差集

comm 可以比较两个文件的
- 交集：打印所有共有的行
- 求差：打印制定文件所包含且不相同的行
- 差集：打印包含在文件A中，但不包含在其他指定文件中的行

comm命令必须使用经过排序的文件作为输入。

##粘滞位

应用于目录的权限类型，只有目录的所有者才能够删除目录中的文件，即使用户组和其他用户
拥有足够的权限也不能执行该删除操作。
`chmod a+t directory_name`

##以不同用户运行可执行文件

一些可执行文件需要不同的用户身份，用文件路径来执行（./executable_name)。有一个叫做
setuid的特殊文件权限，它允许其他用户以文件所有者的身份来执行文件

首先谁的那个该文件所有权替换为该用户
`chmod +s executable_file`
`chown root.root executable_file`
`chmod +s executable_file`
现在这个文件实际上每次都是以超级用户的身份来运行的。

setuid 的使用不是无限制的，为了确保安全，只能用于ELF格式的二进制上。脚本是无法使用的。

##设置文件不可修改

`chattr +i file`
这样文件就不可修改了

如果需要重新可写，移除不可修改属性

`chattr -i file`

##批量生成文件
```shell
for name in test{1..100}.txt
do
touch $name
done
```
如果文件已经存在，touch命令将修改该文件的所有时间戳为当前时间。

`touch -a #只修改访问时间`
`touch -m #只修改内容修改时间`

我们还能为时间指定特定的时间和日期

`touch -d "Fri Jun 25 20:22:22 IST 1999" filename`
-d 可以接受任意标准日期格式

# 列举文件类型统计信息

file命令：打印文件类型信息

`file filename`

`file -b filename` :打印不包括文件名在内的信息

文件统计脚本：filestat.sh

## 显示当前路径下的目录

1. `ls -d */`
2. `ls -l | grep ^d `
3. `find . -type d -maxdepth 1`

## 统计文件

统计行数
`wc -l file`
`cat file | wc -l`

统计单词数
`wc -w file`
`cat file | wc -l`

统计字符数
`wc -c file`
`cat file | wc -c`

统计文件
`wc file`
显示行数，单词数，字符数

打印最长行的长度
`wc file -L`

## 打印目录树

`tree directory`

以html形式输出

`tree directory -H http://localhost -o out.html`


