#!/bin/bash

DB_USER=$1
DB_PASS=$2

sudo apt update

echo "-----------------INSTALLING MYSQL--------------------------------"
#sudo apt -y install mysql-server
#echo 'sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "-------------------------------------------------------------------------"


echo "-----------------CREATING DATABASES--------------------------------"
mysql -u $DB_USER -p$DB_PASS -e "CREATE DATABASE htms"
mysql -u $DB_USER -p$DB_PASS -e "CREATE DATABASE htms_backup"
mysql -u $DB_USER -p$DB_PASS -e "CREATE DATABASE tis"
mysql -u $DB_USER -p$DB_PASS -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'itspe'"
mysql -u $DB_USER -p$DB_PASS -e "FLUSH PRIVILEGES"
echo "-------------------------------------------------------------------------"

echo "-----------------RESTARTING MYSQL SERVER--------------------------------"
sudo service mysql restart
echo "-------------------------------------------------------------------------"

echo "-----------------SETTING DATABASES--------------------------------"
mysql -u $DB_USER -p$DB_PASS htms < ./htms_schema.sql
mysql -u $DB_USER -p$DB_PASS tis < ./tis_schema.sql
mysql -u $DB_USER -p$DB_PASS htms_backup < ./htms_backup.sql
echo "-------------------------------------------------------------------------"

echo "-------------------------------------------------------------------------"
echo "-------------				YOU ARE ALL SET NOW !!		-------------------"
echo "-------------------------------------------------------------------------"
