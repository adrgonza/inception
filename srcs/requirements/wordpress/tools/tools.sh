#! /bin/sh

sleep 2

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/wordpress
wp config create --dbname="$MYSQL_DBNAME" --dbuser="$MYSQL_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --path=/wordpress
wp core install --url=$DOMAIN_NAME --title="AdrixelcrackSite" --admin_user="admin" --admin_password="admin" --admin_email="admin@example.com" --path=/var/www/html
wp user create --path=/var/www/html "user" "mail" --role=author --user_pass="hola --allow-root

php-fpm81 --nodaemonize
