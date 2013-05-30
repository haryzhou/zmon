目录说明:

1、 配置文件目录conf/
    
    |chnl/              : 渠道配置目录
    |    cardsv.conf    : 渠道商cardsv的配置, 包含host/port/codec
    |    ryx.conf       : 渠道商ryx的配置,同cardsv
    |    t/             : 测试目录
    |        |co.req    : 测试请求数据(解包后的)
    |        |co.res    : 测试应答数据(解包后的)
    |bank/              : 银行配置目录
    |    |spd.conf      : 银行-spd配置, 包括host/port/codec
    |    |spd.simu      : 银行-spd模拟器开发, 包括pack/unpack/tcode/debug_req/debug_res
    |    |spd/          : 银行-spd配置
    |        |co.c2b    : 银行-spd定制开发接口c2b(渠道请求--->银行请求)
    |        |co.b2c    : 银行-spd定制开发接口b2c(银行应答--->渠道应答)
    |        |co.req    : 银行-spd模拟请求数据
    |        |co.simu   : 银行-spd交易模拟器-co交易模拟处理开发
    |zmon.conf          : 应用主配置: db/chnl/bank
    |zeta.conf          : zeta配置
    |chnl.conf          : 渠道配置文件, 包含host/port/codec
    |chnl.simu          : 渠道的模拟器配置, 包含pack/unpack/tcode/debug_req/debug_res
    |bank.conf          : 银行配置, 此文件将读取bank/目录下每个银行的配置文件

2、 bin目录

    tsimu  : 用来测试银行模拟器交易的
    tchnl  : 渠道交易测试(发起渠道商交易请求到zmon应用)
    tperf  : 性能测试工具

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
    
    Zsimu.log              : 模拟器日志
    Zworker.N.log          : 第N个工作进程日志
    Zchnl.CHNL_NAME.N.log  : 第N个工作进程的某个渠道日志
    Zbank.BANK_NAME.N.log  : 第N个工作进程的某个银行日志
    Zbackend.log           : 测试用-后线流水同步进程
    Zmagent.log            : 监控节点进程日志
    Zstomp.log             : 测试用-可靠消息队列

6、 t目录

