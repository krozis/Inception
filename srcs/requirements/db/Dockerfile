FROM mariadb:stelie42

#COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/db_creator.sql /
COPY ./tools/db_creator.sh /

RUN chmod +x /db_creator.sh

ENTRYPOINT [ "/db_creator.sh" ]
EXPOSE 3306

#RUN service mariadb start && mariadb < /db_creator.sql && rm -f /db_creator.sql
#CMD [ "sh", "/db_creator.sh" ]

CMD ["mysqld_safe"]