FROM alpine:3.17

LABEL "author"="stelie"

RUN apk update && apk upgrade && apk add mariadb mariadb-client

COPY ./tools/init_db.sh  /tmp/init_db.sh

ENTRYPOINT ["sh", "/tmp/init_db.sh"]