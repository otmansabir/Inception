#!/bin/bash

# Wait for the MariaDB container to initialize
sleep 10

# Check if the WordPress configuration file exists
if [ ! -f /var/www/wordpress/wp-config.php ]; then

    # Create WordPress configuration
    wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'

    # Install WordPress core
    wp core install --allow-root \
        --url="http://localhost" \
        --title="My WordPress Site" \
        --admin_user="admin" \
        --admin_password="admin_password" \
        --admin_email="admin@example.com" \
        --path='/var/www/wordpress'

    # Create an additional WordPress user
    wp user create --allow-root \
        editor editor@example.com \
        --role=editor \
        --user_pass="editor_password" \
        --path='/var/www/wordpress'

fi

# Start PHP-FPM in the foreground
/usr/sbin/php-fpm7.3 -F

