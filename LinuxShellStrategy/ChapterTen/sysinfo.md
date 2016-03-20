#搜集系统信息

主机名

`hostname`
或者
`uname -n`

内核版本，硬件架构等
`uname -a`

发行版本
`uname -r`

主机类型
`uname -m`

cpu信息
`cat /proc/cpuinfo`

内存信息
`cat /proc/meminfo`

内存总和
`cat /proc/meminfo | head -1`

系统分区信息
`cat /proc/partitions`
或者
`fdisk -l`

##利用/proc搜集信息
每个进程在/proc下都有对应的目录，以进程号为名称
在/proc/PID下，包括了每个进程的大量信息。
一些重要的文件如下

- environ 传递给该进程的环境变量
- cwd 一个到进程目录的符号链接
- fd 包含了进程使用的文件描述符






