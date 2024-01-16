FROM alpine:3.18

RUN apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj "/CN=adrgonza.42.fr" -days 365

CMD ["nginx", "-g", "daemon off;"]

#-x509: changes csr method to a self-signed

#-nodes: dont encrypt the ssl key with a phrasse

#-newkey rsa:2048: specifies the creation of a new RSA private key with a length of 2048 bits.
