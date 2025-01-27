FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install nginx -y && apt install openssl -y

COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/script.sh /
CMD ["/script.sh"]