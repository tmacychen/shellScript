#利用git来备份


1. 进入需要备份的目录

`cd /home/tmacy/source`

2. 设置并初始化远端备份目录

```shell
mkdir -p /home/backups/backup.git
cd /home/backups/backup.git
git init --bare
```
`git config --global user.name "tmacy"`
`git config --golbal user.email tmacy@deepin.com`

初始化仓库
`git init`
`git commit --allow-empty -am "Init"`

3.在本地目录下执行
```shell
git remote add origin user@remotehost:/home/backups/backup.git
git push origin master

```
4. 为git跟踪添加或删除文件
`git add *`
`git add *.txt`
`git rm file`

5. 创建备份点
`git commit -m "commit message"`

如我们需要定期更新远端的备份，因此需要一个cron任务
`0 */5 * * * /home/tmacy/backup.sh`
创建脚本：
``shell
cd /home/tmacy/source
git add .
git commit -am "commit -@ $(date)"
git push
```

备份系统完成

6.恢复备份数据

查看所有备份版本:`git log`

要返回之前状态的版本，要查看一个由32位16进制组成的ID(commit ID)
`git checkout 3424344dfadfds342....`
`git commit -am "Restore @ $(date) commit ID : 2323232323..."`
`git push`

如果工作目录由于某些原因损坏，我们从远端中重建损坏的内容
`git clone user@remotehost:/home/backups/backup.git`






