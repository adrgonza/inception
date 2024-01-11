FROM alpine:3.18

RUN apk add --no-cache mariadb mariadb-client

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/my.cnf /etc/my.cnf
COPY tools/tools.sh ./

RUN chmod 777 tools.sh

CMD ["./tools.sh"]
