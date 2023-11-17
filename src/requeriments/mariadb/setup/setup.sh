#!/bin/sh

service mariadb start

# Create Wordpress database
mariadb -e "CREATE DATABASE $MYSQL_DATABASE"

# Create Mariadb/Wordpress user
mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS'"

# Grant privileges to user
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%'"

# Make sure that NOBODY can access the server without a password
mariadb -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';FLUSH PRIVILEGES"