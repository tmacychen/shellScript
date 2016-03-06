#录制与回放

script 和 scriptreplay

#文件查找

查看当前目录中的内容

`find . -print`

-print是表示以'\n'为分隔文件的定界符
-print0 表示以'\0'为分隔文件的定界符

`find /home/tmacy -name "*.txt" -print`

-name 指定了文件名必须匹配的字符串

-iname 表示忽略大小写

如果想匹配多个条件中的一个，可以采用OR

`find . \(-name "*.txt" -o name "*.pdf" \) -print`

-path 可以使用通配符来匹配文件路径或文件，-name总是用给定
的文件名进行匹配。

-regex 使用正则表达式来匹配


