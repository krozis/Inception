FROM alpine:3.17

LABEL "author"="stelie"

RUN apk update && apk upgrade && apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld/ && chown -R mysql:mysql /run/mysqld && chown -R mysql:mysql /var/lib/mysql
RUN mariadb-install-db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh


ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
