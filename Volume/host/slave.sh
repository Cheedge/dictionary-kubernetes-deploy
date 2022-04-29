#!/bin/bash
#SLAVE_IP=`hostname -I`
# MASTER_IP=`getent hosts ${MASTER_CONTAINER} | awk '{print $1}'`
# IP="127.0.0.1"
HOST_NAME=`hostname`
# LOG_FILE=`mysql -h ${IP} -uroot --port 3306 -pMysql_666 -AN --execute "show master status;" | awk '{print $1}'`
# LOG_POS=`mysql -h ${IP} -uroot --port 3306 -pMysql_666 -AN --execute "show master status;" | awk '{print $2}'`
LOG_FILE=`cat /myconfigure-file/master-log-info.txt | awk '{print $1}'`
LOG_POS=`cat /myconfigure-file/master-log-info.txt | awk '{print $2}'`
SOURCE_IP=`cat /myconfigure-file/master-host.txt`
echo "finished reading info"
mysql -h ${HOST_NAME} -uroot -pMysql_666 -AN --execute "CHANGE REPLICATION SOURCE TO SOURCE_HOST='${SOURCE_IP}', SOURCE_PORT=3306, SOURCE_USER='slave', SOURCE_PASSWORD='Mysql_666', SOURCE_LOG_FILE='${LOG_FILE}', SOURCE_LOG_POS=${LOG_POS};"
echo "finished replication"
