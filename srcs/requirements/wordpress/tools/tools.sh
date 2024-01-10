#! /bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wpç

while true; do
    if mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "SELECT 1;" ; then
        break
    fi
    sleep 1
done

wp core download --path=/wordpress
wp config create --dbname="$MYSQL_DBNAME" --dbuser="$MYSQL_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --path=/wordpress
wp core install --url="$DOMAIN_NAME" --title="Your Site Title" --admin_user="admin" --admin_password="your_admin_password" --admin_email="admin@example.com" --path=/var/www/html

php-fpm81 --nodaemonize
