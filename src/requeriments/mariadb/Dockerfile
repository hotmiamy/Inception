FROM debian:bullseye

ARG MYSQL_DATABASE
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASS
ARG MYSQL_USER
ARG MYSQL_PASS

RUN apt update
RUN apt install mariadb-server mariadb-client procps -y

RUN	mkdir -p /var/lib/mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN	rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./setup/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN	chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	echo "\n[mariadb]\nbind-address=0.0.0.0\nport=3306\n" >>/etc/mysql/my.cnf


COPY setup /tmp/
RUN chmod a+x /tmp/setup.sh
RUN /tmp/setup.sh

EXPOSE 3306

CMD [ "mysqld_safe" ]