FROM debian:oldstable

RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN apt update -y
RUN apt install mariadb-server mariadb-client -y

COPY setup /tmp/
RUN chmod 111 /tmp/setup.sh
RUN /tmp/setup.sh

EXPOSE 3306

ENTRYPOINT [ "mysqld_safe" ]