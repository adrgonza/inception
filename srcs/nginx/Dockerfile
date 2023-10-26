FROM alpine:3.17

RUN apk update && apk add nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
