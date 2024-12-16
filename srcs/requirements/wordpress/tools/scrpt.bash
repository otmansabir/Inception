#!/bin/bash

# Create necessary directories
mkdir -p /var/www/wordpress
cd /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

# Download WordPress
wp core download --allow-root 

# Configure WordPress
wp core config \
    --dbhost=mariadb:3306 \
    --dbname="$MARIA_DABE" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PASSWORD" \
    --allow-root \

# Install WordPress
wp core install \
    --url="$DOMAIN_NAME" \
    --title="$WP_T" \
    --admin_user="$WP_ADMIN_NAME" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root \

# Add a user
wp user create \
    "$WP_USER_NAME" \
    "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PASS" \
    --role="$WP_USER_ROLE" \
    --allow-root \

# Adjust PHP-FPM settings
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

# Start PHP-FPM
/usr/sbin/php-fpm7.4 -F

