#!/bin/bash

mkdir -p /etc/ssl/

# Generate private key
openssl genpkey -algorithm RSA -out /etc/ssl/inception.key

# Create a Certificate Signing Request (CSR)
openssl req -new -key /etc/ssl/inception.key -out /etc/ssl/inception.csr -subj "/C=${C}/O=${O}/CN=${DOMAIN_NAME}"

# Generate SSL certificate
openssl x509 -req -days 365 -in /etc/ssl/inception.csr -signkey /etc/ssl/inception.key -out /etc/ssl/inception.crt

mkdir -p /etc/nginx/
mkdir -p /var/www/wordpress

echo > /etc/nginx/nginx.conf <<CONFIG

events \{\}

http \{ 
    server \{ 
        # Listen on port ${NGINX_PORT} for HTTPS traffic with SSL enabled
        listen ${NGINX_PORT} ssl;

        ssl_certificate /etc/ssl/inception.crt;

        ssl_certificate_key /etc/ssl/inception.key;

        ssl_protocols TLSv1.3;

        root /var/www/wordpress;

        server_name ${DOMAIN_NAME};

        # The default file to serve when no specific file is requested
        index index.php;

        # Handle requests for PHP files
        location ~ \\.php\$ \{ 
            # Include the FastCGI configuration for PHP
            include snippets/fastcgi-php.conf;

            # Pass PHP requests to the FastCGI server running on port ${WP_PORT} of the 'wordpress' service
            fastcgi_pass ${WP_HOST}:${WP_PORT};
        \}
    \}
\}
CONFIG

nginx -g "daemon off;"

sleep 1000000
