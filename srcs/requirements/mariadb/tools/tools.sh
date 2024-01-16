#!/bin/sh

mysql_install_db

mysqld_safe &

sleep 2

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DBNAME;" >> "mysql-init.sql"
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> "mysql-init.sql"
echo "GRANT ALL PRIVILEGES ON $MYSQL_DBNAME.* TO '$MYSQL_USER'@'%';" >> "mysql-init.sql"
echo "FLUSH PRIVILEGES;" >> "mysql-init.sql"

mysql -u root -p"$MYSQL_ROOT_PASSWORD" < mysql-init.sql

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld --datadir="/var/lib/mysql" --socket="/var/run/mysqld/mysqld.sock" --user=mysql
