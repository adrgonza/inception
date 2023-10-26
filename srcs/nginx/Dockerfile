# Set the background image that is gonna be buiting our container
FROM alpine:3.17 

# Set the working directory
WORKDIR ~/

# Update and install necessary packages
RUN apk update \
	&& apk upgrade \
	# Allows to not cache the index locally
	&& apk add --no-cache \ 
	&& apk add nginx \
	&& apk add opnssl

# Expose port 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
