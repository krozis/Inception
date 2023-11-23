FROM alpine:3.17

#Alpine version
RUN apk update && \
  apk add --no-cache \
  mariadb mariadb-client

#Debian version
#RUN apt update -y && apt install mariadb-server -y && apt upgrade -y
 
EXPOSE 3306

VOLUME ["/var/lib/mysql"]

CMD [ "mysqld_safe" ]