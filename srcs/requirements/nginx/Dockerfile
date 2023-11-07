# Set the background image that is gonna be buiting our container
FROM alpine:3.17

# Update and install necessary packages
RUN apk add --no-cache nginx openssl

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
