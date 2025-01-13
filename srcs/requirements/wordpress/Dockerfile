FROM debian:oldstable

RUN apt update -y && apt install php-fpm php-mysql -y && apt install curl -y

COPY ./tools/script.sh /
CMD ["/script.sh"]