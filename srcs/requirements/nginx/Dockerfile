FROM alpine:3.17

LABEL "author"="stelie"

# Install OpenSSL and NGINX
RUN apk update && apk upgrade && apk add --no-cache openssl nginx

# SSL Certificate
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -days 365 -newkey rsa:4096 -nodes \
    -out /etc/nginx/ssl/nginx_selfsigned.crt \
    -keyout /etc/nginx/ssl/nginx_selfsigned.key \
    -subj "/C=FR/ST=Paris/O=42Born2Code/CN=stelie.42.fr"

# Copy NGINX configuration file
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

# Start NGINX
ENTRYPOINT ["nginx", "-g", "daemon off;"]
