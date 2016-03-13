#下载

1. wget

`wget URL1 URL2`

远程下载网页或者文件

-t 指定重试次数 `wget -t 5 URL`

下载限速

`wget --limit-rate 500k URL`

最大配额 :指定最大的下载额度，配额一旦用完，下载随之停止

--quota 或者-Q

断点续传：使用-c从断点出继续下载。

复制或镜像整个站点：以递归的方式爬网站所有URL
`wget --mirror URL`

一些需要认证的站点，用--user --password来输入用户名和密码

将web页面格式化为纯文本形式
`lynx --dump http://www.google.com > text.txt`

2. curl

`curl URL`

--silent 不显示进度信息

-O 将下载的数据写入文件

--progress 显示进度条



