#!/bin/sh

mysql_install_db #this command inicializate the data base and create the directorys


echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DBNAME;" >> "mysql-init.sql" #create the database
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> "mysql-init.sql" #create the user
echo "GRANT ALL PRIVILEGES ON $MYSQL_DBNAME.* TO '$MYSQL_USER'@'%';" >> "mysql-init.sql" #give all the privileges to the user
echo "FLUSH PRIVILEGES;" >> "mysql-init.sql" #update all privileges tables

exec mysqld_safe --init-file="/mysql-init.sql"
