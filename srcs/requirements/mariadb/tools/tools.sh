#! /bin/sh

mysql_install_db

if [ ! -d "/var/lib/mysql/$MYSQL_DBNAME" ]; then
    echo "CREATE DATABASE $MYSQL_DBNAME;" >> "mysql-init.txt"
    echo "CREATE USER " >> "mysql-init.txt"
    echo "CREATE USER " >> "mysql-init.txt"
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DBNAME" >> "mysql-init.txt"
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DBNAME" >> "mysql-init.txt"
    echo "DROP USER " >> "mysql-init.txt"
    echo "FLUSH PRIVILEGES;" >> "mysql-init.txt"
    mysqld_safe --init-file=mysql-init.txt
else
    mysqld_safe
fi
