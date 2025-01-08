FROM debian:oldstable

RUN apt -y update && apt -y install nginx && apt -y install openssl

COPY ./tools/script.sh /
CMD [ "/script.sh" ]