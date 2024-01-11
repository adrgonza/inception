#!/bin/sh

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp.phar

wp.phar core download --path=/wordpress
wp.phar config create --dbname="$MYSQL_DBNAME" --dbuser="$MYSQL_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --path=/wordpress --force
wp.phar core install --url="$DOMAIN_NAME" --title="AdrixelcrackSite" --admin_user="admin" --admin_password="admin" --admin_email="admin@gmail.com" --path=/wordpress
wp.phar user create --path=/wordpress "user" "adri@gmail.com" --role=author --user_pass="holaholaº" --allow-root

php-fpm81 --nodaemonize
