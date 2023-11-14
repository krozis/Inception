FROM debian:bullseye

RUN apt update -y && apt install mariadb-server -y

COPY ./tools/script.sh_no_env /script.sh
#COPY ./tools/script.sh /

EXPOSE 3306

CMD sh /script.sh 

