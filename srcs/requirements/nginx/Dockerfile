FROM debian:bullseye

RUN apt-get -y update && apt-get install -y openssl nginx

COPY ./tools/script.sh /
COPY conf /etc/nginx/nginx.conf

EXPOSE 443

RUN sh /script.sh

CMD ["nginx","-g", "daemon off;"]