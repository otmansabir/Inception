FROM debian:bullseye

# Update and upgrade system packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/ssl/csr /etc/ssl/certs

# Generate private key
RUN openssl genpkey -algorithm RSA -out /etc/ssl/inception.key

COPY ./tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]
