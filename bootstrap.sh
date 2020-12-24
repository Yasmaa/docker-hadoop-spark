#!/bin/bash
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"
# # start ssh server
# echo "Starting the sshd in the master"
# /etc/init.d/ssh start
# # service ssh start
# # format namenode
# $HADOOP_HOME/bin/hdfs namenode -format
# # start hadoop
# $HADOOP_HOME/sbin/start-dfs.sh
# $HADOOP_HOME/sbin/start-yarn.sh

# # start spark
# $SPARK_HOME/sbin/start-all.sh

# # keep container running
# tail -f /dev/null

#!/bin/bash

: ${HADOOP_HOME:=/usr/local/hadoop}

# $HADOOP_HOME/etc/hadoop/hadoop-env.sh

# rm /tmp/*.pid
# cd $HADOOP_HOME/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

service ssh start
$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh


if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi