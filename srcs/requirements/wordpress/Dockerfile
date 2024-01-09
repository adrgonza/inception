FROM alpine:3.18

RUN apk add --no-cache curl \
                    php-fpm \
                    php-phar \
                    php-mysqli \
                    mariadb-client \
                    php-mbstring \
                    php-session

COPY conf/php-fpm.conf /etc/php81/php-fpm.d/www.conf
COPY tools/tools.sh ./

RUN chmod 777 tools.sh

CMD [./tools.sh]