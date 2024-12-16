FROM debian:bullseye

# Update and upgrade system packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/ssl/csr /etc/ssl/certs

# Generate private key
RUN openssl genpkey -algorithm RSA -out /etc/ssl/inception.key

# Create a Certificate Signing Request (CSR)
RUN openssl req -new -key /etc/ssl/inception.key -out /etc/ssl/csr/inception.csr -subj "/C=MA/O=1337/CN=sabir.42.fr"

# Generate SSL certificate
RUN openssl x509 -req -days 365 -in /etc/ssl/csr/inception.csr -signkey /etc/ssl/inception.key -out /etc/ssl/certs/inception.crt

# Copy the Nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/

# Create the WordPress directory
RUN mkdir -p /var/www/wordpress

# Set ownership of the WordPress directory
RUN chown -R www-data:www-data /var/www/wordpress

# EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
