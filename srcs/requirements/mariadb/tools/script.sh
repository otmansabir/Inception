#!/bin/bash

service mariadb start

sleep 5

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${MARIA_DABE}\`;"

mariadb -u root -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${MARIA_DABE}\`.* TO \`${MARIADB_USER}\`@'%';"

mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld_safe --port=${DB_PORT} --bind-address=${BIND_ADDR}


sleep 1000000
