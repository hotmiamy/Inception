FROM debian:bullseye

ARG WORDPRESS_DB_HOST
ARG WORDPRESS_DB_NAME
ARG WORDPRESS_URL
ARG WORDPRESS_GUEST_USER
ARG WORDPRESS_GUEST_PASSWORD
ARG WORDPRESS_GUEST_EMAIL
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_ADMIN_USER
ARG WORDPRESS_ADMIN_PASSWORD
ARG WORDPRESS_ADMIN_EMAIL

RUN apt update
RUN apt install -y apt-utils php7.4 \
    php7.4-mysql \
    php7.4-fpm \
    mariadb-client \
    vim \
    wget \
    sudo && mkdir /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/bin/wp


WORKDIR	/var/www/html/wordpress

COPY    setup.sh .
RUN     chmod 777 setup.sh

EXPOSE		9000

ENTRYPOINT [ "sh", "setup.sh" ] 