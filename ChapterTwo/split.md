#分割文件和数据

测试：生成一个大小是10k的测试文件：

`dd if=/dev/zero bs=100k count=1 of=date.file`

指定分割大小，将文件分割成多个更小的文件
`split -b 10k data.file`

以上命令会将文件data.file分割成多个小文件，每个文件大小10kb
这些文件以xaa,xab,xac等方式命名。

以数字作为后缀命名：`split -b 10k data.file -d -a 4`

-d 指定以数字作为后缀，-a 4 指定后缀长度为4

前缀是split命令的最后一个参数

#提取文件名与扩展名

file='a.txt'
name=${file%.*}
extension=${file#*.}

%.* 是表示从右向左执行非贪婪匹配，匹配的字符是'.'
\#*. 是表示从左向右执行非贪婪匹配，匹配的字符是'.'

%% 与 ## 是与之对应的贪婪匹配


