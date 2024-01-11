#!/bin/sh

# Initialize the MySQL data directory
mysql_install_db

# Start MariaDB server
mysqld_safe &

# Wait for MySQL to start (you can adjust the sleep duration based on your system)
sleep 2

# Run mysql_upgrade
mysql_upgrade -u root -p"$MYSQL_ROOT_PASSWORD"

# Create MySQL initialization script
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DBNAME;" >> "mysql-init.sql"
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> "mysql-init.sql"
echo "GRANT ALL PRIVILEGES ON $MYSQL_DBNAME.* TO '$MYSQL_USER'@'%';" >> "mysql-init.sql"
echo "FLUSH PRIVILEGES;" >> "mysql-init.sql"

# Run MySQL initialization script
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < mysql-init.sql

# Remove sensitive information
rm -f mysql-init.sql

# Stop MariaDB server
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Start MariaDB server with binding to all addresses
mysqld --datadir="/var/lib/mysql" --socket="/var/run/mysqld/mysqld.sock" --user=mysql
