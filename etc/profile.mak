export ZETA_HOME=$HOME/workspace/zeta
export ZMON_HOME=$HOME/workspace/zmon
export PERL5LIB=$ZETA_HOME/lib::$ZMON_HOME/lib
export PLUGIN_PATH=$ZMON_HOME/plugin
export PATH=$ZMON_HOME/bin:$ZMON_HOME/sbin:$ZETA_HOME/bin:$PATH

# 节点编号
export ZMON_ID=0;

export DB_NAME=zdb_dev
export DB_USER=ypinst
export DB_PASS=ypinst
export DB_SCHEMA=ypinst
alias dbc='db2 connect to $DB_NAME user $DB_USER using $DB_PASS'

export DB_NAME_BKE=zdb_dev
export DB_USER_BKE=ypinst
export DB_PASS_BKE=ypinst
export DB_SCHEMA_BKE=ypinst
alias dbbc='db2 connect to $DB_NAME_BKE user $DB_USER_BKE using $DB_PASS_BKE'

alias cdl='cd $ZMON_HOME/log';
alias cdd='cd $ZMON_HOME/data';
alias cdlb='cd $ZMON_HOME/lib/Zero';
alias cdle='cd $ZMON_HOME/libexec';
alias cdb='cd $ZMON_HOME/bin';
alias cdsb='cd $ZMON_HOME/sbin';
alias cdc='cd $ZMON_HOME/conf';
alias cde='cd $ZMON_HOME/etc';
alias cdt='cd $ZMON_HOME/t';
alias cdh='cd $ZMON_HOME';
alias cdtb='cd $ZMON_HOME/sql/table';

