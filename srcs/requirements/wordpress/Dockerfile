FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php php7.4-fpm php-mysql curl

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN chmod +x /usr/local/bin/wp

COPY ./tools/script.sh /

RUN chmod +x /script.sh

EXPOSE 9000

CMD ["/script.sh"]
