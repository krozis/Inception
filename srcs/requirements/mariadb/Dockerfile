FROM debian:bullseye

RUN apt update -y && apt install mariadb-server -y

COPY ./tools/script.sh /

EXPOSE 3306

RUN sh /script.sh 

