#grep 用法汇总

`grep match_pattern filename`

`grep match_text file1 file2 file3`

以上为通配符，使用正则需要加-E

`grep -E "[a-z]+"`
或
`egrep "[a-z]+"`

只输出匹配到的文件部分，可以使用-o

`echo this is a line. | egrep -o "[a-z]+\."`

打印匹配之外的所有行

`grep -v match_pattern file`

-v 表示反转invert
-n 打印匹配到的行数，如果多个文件，会打印文件名
-i 忽略大小写
-R -r 递归搜索
-e 匹配多个模式
`grep -e "pattern1" -e "pattern2"`

-f 读取模式文件，在文件中可以放多个模式

统计匹配到的数量

`egrep -o "pattern" file | wc -l`

在搜索中包含或排除文件

在目录中搜索所有的.c和.cpp
`grep "main()" . -r --include *.{c,cpp}`

在目录中排除所有的Readme

`grep "main()" . -r --exclude "README"`

与xargs连用，指明以0作为终止符

`grep "text" file* -lZ | xargs -0 rm`

-q 静默输出，用来测试文本匹配是否存在某个文件中

silent_grep.sh


