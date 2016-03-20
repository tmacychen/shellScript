#网络流量与端口分析


##列出系统中开放的端口

`lsof -i`

列出开放的端口以及服务的详细信息

lsof的每一项最后一列类似与：

`tmacy-pc.deepin.sh:60522->101.71.28.141:http (ESTABLISHED)`

tmacy-pc.deepin.sh:60522 对应本地主机
101.71.28.141:http (ESTABLISHED) 对应远程主机服务

列出本地主机当前开放的端口

`lsof -i | grep ":[0-9]\+->" -p | grep "[0-9]\+" -o | sort | uniq`

##netstat

`netstat -tnp` 列出开放的端口与服务
