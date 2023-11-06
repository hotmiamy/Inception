FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/llopes.crt -keyout /etc/nginx/ssl/llopes.key \
		-subj "/C=42/ST=SP/L=SP/O=Global Security/OU=Inception/CN=llopes-n.42.fr"

COPY ./nginx.conf ./etc/nginx/conf.d

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]