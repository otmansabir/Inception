FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/ssl/csr /etc/ssl/certs

RUN openssl genpkey -algorithm RSA -out /etc/ssl/inception.key

COPY ./tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]
