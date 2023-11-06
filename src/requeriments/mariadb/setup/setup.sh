#!/bin/sh

service mariadb start;

mariadb -e "CREATE DATABASE test";