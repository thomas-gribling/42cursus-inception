FROM debian:oldstable

RUN apt update -y && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /
CMD ["/script.sh"]