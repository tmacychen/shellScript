#tar

tar output.tar file1 file2...

选项含义

-c 创建文件
-v 显示
-f 指定文件名称
-r 往已知的归档文件中追加一个文件 `tar -rvf original.tar new_file`
-t 列出归档文件中的内容

-x 提取文件 `tar -xf example.tar` 会提取文件到当前目录，可以用-C来指定需要提取到哪个目录

在归档中，我们可以将stdout指定为输出文件,另一个命令可以通过管道将它作为stdin，并进行其他处理或提取内容
当使用-c选项时，-f指定stdout作为归档文件
当使用-x选项时，-f指定stdin用于提取内容

`tar -cf - file1 file2 | tar -xvf - -C ~/destination`

-A 用于合并多个tar文件 `tar -Af file1.tar file2.tar`

-u 只有比归档文件中同名的文件更新的时候才进行添加
`tar -uvf archive.tar filea`

-d 比较归档中的文件与当前目录中的同名文件有何差异
`tar -df archive.tar file1 file2 ...`

--delete 将给定的归档文件中删除文件

`tar -f archive.tar --delete file1 file2 ....`

--exclude pattern  根据通配符来排除部分文件
`tar -cf archive.tar --exclude "*.txt"` 排除所有txt文件

-z 选择gzip来压缩文件
`tar -czvf archive.tar.gz file1 file2 ...`
`tar -xavf archive.tar.gz -C directory`

如果有成千上万的文件需要归档压缩，我们可以循环添加文件
```shell
FILE_LIST="file1 file2 file3 ...."
for f in $FILE_LIST;
do
tar -rvf archive.tar $f
done
gzip archive.tar
```
zcat 可以直接从压缩文件中读取文件到stdout上

gzip可以指定压缩率,1最低，9最高：`gzip -9 testfile`

-j 选择bzip2来压缩文件
`tar -cjvf archive.tar.bz2 file1 file2 ...`
`tar -xjvf archive.tar.bz2`
同样bzip2也会制定压缩率，从1-9
`bzip2 -9 file`



