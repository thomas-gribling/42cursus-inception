FROM debian:oldstable

RUN apt update -y
RUN apt install mariadb-client mariadb-server -y
RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /

CMD ["/script.sh"]