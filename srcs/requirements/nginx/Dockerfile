# Set the background image that is gonna be buiting our container
FROM alpine:3.17

# Update and install necessary packages
RUN apk add --no-cache nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
