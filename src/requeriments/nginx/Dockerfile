FROM debian:bullseye

ARG DOMAIN_NAME
ARG CERTS_CRT
ARG CERTS_KEY

RUN apt update && apt upgrade -y
RUN apt install nginx openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out $CERTS_CRT -keyout $CERTS_KEY \
		-subj "/C=42/ST=SP/L=SP/O=Global Security/OU=Inception/CN=$DOMAIN_NAME"

EXPOSE 443

COPY ./nginx.conf ./etc/nginx/conf.d/nginx.conf

RUN		mkdir -p /run/nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]