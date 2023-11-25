FROM alpine:3.17

LABEL "author"="stelie"

RUN apk update && apk upgrade && apk add mariadb mariadb-client

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
