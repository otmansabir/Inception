#!/bin/bash

mkdir -p /etc/ssl/

openssl genpkey -algorithm RSA -out /etc/ssl/inception.key

# Create a Certificate Signing Request (CSR)
openssl req -new -key /etc/ssl/inception.key -out /etc/ssl/inception.csr -subj "/C=${C}/O=${O}/CN=${DOMAIN_NAME}"

openssl x509 -req -days 365 -in /etc/ssl/inception.csr -signkey /etc/ssl/inception.key -out /etc/ssl/inception.crt

mkdir -p /etc/nginx/
mkdir -p /var/www/wordpress

echo "

events {}

http { 
    include /etc/nginx/mime.types;
    server { 
        listen ${NGINX_PORT} ssl;
        ssl_certificate /etc/ssl/inception.crt;
        ssl_certificate_key /etc/ssl/inception.key;
        ssl_protocols TLSv1.3;
        root /var/www/wordpress;
        server_name ${DOMAIN_NAME};
        index index.php;
        location ~ \\.php\$ { 
            include snippets/fastcgi-php.conf;
            fastcgi_pass ${WP_HOST}:${WP_PORT};
        }
    }
}
" > /etc/nginx/nginx.conf

nginx -g "daemon off;"
