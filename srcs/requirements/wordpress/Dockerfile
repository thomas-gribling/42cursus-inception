FROM debian:oldstable

RUN apt update -y
RUN apt install php-fpm php-mysql -y && apt install curl -y

COPY ./tools/script.sh /
ENTRYPOINT ["sh", "/script.sh"]