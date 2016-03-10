#sed

-i 替换源文件
s/this/THIS/g 全局匹配
s/this/THIS/2g 从第二个开始替换

##实例

1. 移除空白
`sed '/^$/d' file`

2. 用&标记匹配样式的字符串，能够提哈un字符串的同时使用已匹配的内容

`echo this is an example | sed 's/\w\+/[&]/g'`

正则表达式\w\+匹配每个单词，用[&]来替换它，&对应于之前所匹配到的单词

3. 字串匹配标记\1

&代表匹配给定样式的字符串，我们也可以匹配给定样式的其中一个部分。
`echo this is digit 7 in a number | sed 's/digit \([0-9]\)/\1/'`

\(pattern\) 用于匹配字串。模式包含在被斜线转义过的()中。对于匹配到的字串
对应标记是\1,匹配到的第二个字串是\2

`echo seven ELEVEN | sed 's/\([a-z]\+\) \([a-z]\+\)/\2 \1/g'`

输出结果为ELEVEN seven

4. 多个表达式
`sed 'expression' | sed 'expression'`
等价
`sed 'expression; expression'`

5.引用变量
```shell
text=hello
echo hello world | sed "s/$text/HELLO/"
```
使用变量时，需要用双引号


