FROM alpine:3.18

RUN apk add --no-cache nginx

RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
