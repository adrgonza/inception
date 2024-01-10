FROM alpine:3.18

RUN apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj "/CN=adrgonza.42.fr" -days 365

CMD ["nginx", "-g", "daemon off;"]
