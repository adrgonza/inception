#!/bin/sh

mysql_install_db #this command inicializate the data base and create the directorys

mysqld_safe & #init server in the background in safe_mode

sleep 2

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DBNAME;" >> "mysql-init.sql" #create the database
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> "mysql-init.sql" #create the user
echo "GRANT ALL PRIVILEGES ON $MYSQL_DBNAME.* TO '$MYSQL_USER'@'%';" >> "mysql-init.sql" #give all the privileges to the user
echo "FLUSH PRIVILEGES;" >> "mysql-init.sql" #update all privileges tables

mysql -u root -p"$MYSQL_ROOT_PASSWORD" < mysql-init.sql #exec the script that we created

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown #it shutdown the server

exec mysqld --datadir="/var/lib/mysql" --socket="/var/run/mysqld/mysqld.sock" --user=mysql #execute mysql database in the main process