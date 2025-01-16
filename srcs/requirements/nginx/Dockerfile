FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install nginx -y && apt install openssl -y

COPY ./tools/script.sh /
ENTRYPOINT ["/script.sh"]