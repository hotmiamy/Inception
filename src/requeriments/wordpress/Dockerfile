FROM debian:oldstable


RUN apt update -y
RUN apt install php-fpm -y
RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf
WORKDIR	/var/www/html/wordpress
RUN echo "<?php phpinfo(); ?>" >> /var/www/html/wordpress/info.php
RUN /etc/init.d/php7.4-fpm start

EXPOSE		9000

ENTRYPOINT [ "php-fpm7.4", "--nodaemonize" ] 