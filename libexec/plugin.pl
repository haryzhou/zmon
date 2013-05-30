#!/usr/bin/perl
use strict;
use warnings;
use Carp;
use Zeta::Run;
use DBI;

#
# 加载集中配置文件
#
my $cfg  = do "$ENV{ZMON_HOME}/conf/zmon.conf";
confess "[$@]" if $@;

1;

__END__
