FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install nginx openssl -y && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/llopes.crt -keyout /etc/nginx/ssl/llopes.key \
		-subj "/C=42/ST=SP/L=SP/O=Global Security/OU=Inception/CN=llopes-n.42.fr"

EXPOSE 443

COPY ./nginx.conf ./etc/nginx/conf.d/nginx.conf


RUN		mkdir -p /run/nginx

CMD [ "nginx", "-g", "daemon off;" ]