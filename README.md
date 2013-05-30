目录说明:

1、 配置文件目录conf/
    
    |zmon.conf          : 应用主配置: db/chnl/bank
    |zeta.conf          : zeta配置

2、 bin目录


3、 libexec目录

    plugin.pl  :  加载插件+应用配置
    main.pl    :  主控函数
    worker.pl  :  工作进程函数
    simu.pl    :  按需启动银行模拟器(配置zeta模块时,指定需要运行模拟器的银行列表作为参数para)
    magent.pl  :  监控节点进程
    msvr.pl    :  监控服务器进程

4、 etc目录

    profile.mak  : 开发测试环境变量
    
5、 log目录
    
    Zmagent.log            : 监控节点进程日志
    Zstomp.log             : 测试用-可靠消息队列

6、 t目录

