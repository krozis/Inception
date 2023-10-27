FROM debian:buster

RUN apt -y update && apt install -y openssl nginx

COPY ./tools/script.sh /

#CMD [ "/script.sh" ]

# /!\ Only for testing:
CMD ["nginx", "-g", "daemon off;"]