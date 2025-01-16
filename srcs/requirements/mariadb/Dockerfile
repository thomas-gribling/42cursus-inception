FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /
ENTRYPOINT ["/script.sh"]