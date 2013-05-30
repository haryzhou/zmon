#!/usr/bin/perl
use strict;
use warnings;
use Zeta::Run;
use DBI;
use Carp;
use POE;
use Time::HiRes qw/sleep/;
use constant{
    DEBUG => $ENV{ZMON_DEBUG} || 0,
};


#
# 被监控模块的-监控节点模拟器
#
BEGIN {
    require Data::Dump if DEBUG;
}

sub {
    my @bank = @_;

    # 获取配置
    # zkernel->zsetup();
    my $zcfg = zkernel->zconfig();
    my $logger = zlogger;

    ########################################################
    # 读所有节点-模拟器配置
    my %all;
    for my $app (@bank) {
        my $bsimu = do "$ENV{ZMON_HOME}/conf/simu/$app.simu";
        confess "can not do file[$app.simu] error[$@]" if $@;

        my %proc;
        for my $simu (<$ENV{ZMON_HOME}/conf/bank/$app/*.simu>) {
            $simu =~ /([^\/]+).simu$/;
            $proc{$1} = do $simu;
            confess "can not do file[$simu] error[$@]" if $@;
        }
        $all{$app}{main} = $bsimu;
        $all{$app}{proc} = { %proc };
    }
    $zcfg->{simu} = \%all;
    Data::Dump->dump(\%all);

    ########################################################
    # 启动所需的银行模拟
    for my $app (@bank) {
        $logger->debug("启动模拟器$app:\n" . Data::Dump->dump($zcfg->{bank}{$app}));

        # 模拟器的主回调
        my $cb = sub {
            my $packet = shift;
            my $req    = $zcfg->{simu}{$app}{main}{unpack}->($packet);   # 解包
            my $tcode  = $zcfg->{simu}{$app}{main}{tcode}->($req);       # 内部交易代码
            $logger->debug("$app收到请求$tcode<<<<<<<<:\n", $zcfg->{simu}{$app}{main}{debug_req}->($req));

            my $res = $zcfg->{simu}{$app}{proc}{$tcode}->($req);      # 
            $logger->debug("$app发送应答$tcode>>>>>>>>:\n", $zcfg->{simu}{$app}{main}{debug_res}->($res));

            return $zcfg->{simu}{$app}{main}{pack}->($res);              #
        };

        Zeta::POE::TCPD->spawn(
            port     => $zcfg->{bank}{$app}{port},
            callback => $cb,
            codec    => $zcfg->{bank}{$app}{codec},
        );
    }

    # 运行
    $poe_kernel->run();

    exit 0;
};


