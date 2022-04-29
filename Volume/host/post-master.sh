#!/bin/bash
hostname -i > /myconfigure-file/master-host.txt
mysql -h mysql-stateful-0 -uroot --port 3306  -pMysql_666 -AN -e "CREATE DATABASE Dictionary;"
echo "create database"

mysql -h mysql-stateful-0 -uroot --port 3306  -pMysql_666 < /myconfigure-file/Dictionary.sql
echo "finished import dict database"
mysql -h mysql-stateful-0 -uroot --port 3306  -pMysql_666 -AN -e "show master status;" | awk '{print $1, $2}' > /myconfigure-file/master-log-info.txt
echo "finished logfile and logpos recording"
