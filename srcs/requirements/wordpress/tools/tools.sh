#!/bin/sh

if [ -f "/wordpress/wp-config.php" ]; then
    echo "WordPress is already installed. Deleting existing configuration."
    wp.phar config delete --path=/wordpress
    rm -rf /wordpress/*
fi

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp.phar

wp.phar core download --path=/wordpress
wp.phar config create --dbname="$MYSQL_DBNAME" --dbuser="$MYSQL_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --path=/wordpress --force
wp.phar core install --url="$DOMAIN_NAME" --title="AdrixelcrackSite" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="admin@gmail.com" --path=/wordpress
wp.phar user create --path=/wordpress "$MYSQL_DBNAME" "adri@gmail.com" --role=author --user_pass="$WORDPRESS_DB_PASSWORD" --allow-root

exec php-fpm81 --nodaemonize
