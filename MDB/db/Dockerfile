FROM mariadb:MDB

#COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/db_creator.sql  /var/www/
COPY ./tools/db_creator.sh  /var/www/


RUN chmod +rx /var/www/db_creator.sql
RUN chmod +x /var/www/db_creator.sh

#ENTRYPOINT [ "/db_creator.sh" ]

RUN service mariadb start && service mariadb status && mariadb <  /var/www//db_creator.sql
#CMD [ "sh", "/db_creator.sh" ]

#RUN rm -rf /db_creator.sh /db_creator.sql

CMD ["mysqld_safe"]