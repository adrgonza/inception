#! /bin/sh

mysql_install_db >/dev/null 2>&1

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "CREATE DATABASE inceptionDatabase;" >> "mysql-init.txt"
    echo "CREATE USER " >> "mysql-init.txt"
    echo "CREATE USER " >> "mysql-init.txt"
    echo "GRANT ALL PRIVILEGES ON " >> "mysql-init.txt"
    echo "GRANT ALL PRIVILEGES ON " >> "mysql-init.txt"
    echo "DROP USER " >> "mysql-init.txt"
    echo "FLUSH PRIVILEGES;" >> "mysql-init.txt"
    mysqld_safe --init-file=mysql-init.txt >/dev/null 2>&1
else
    mysqld_safe >/dev/null 2>&1
fi
