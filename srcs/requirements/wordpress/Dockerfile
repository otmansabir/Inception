FROM debian:bullseye

# Update and upgrade system packages
RUN apt-get update && apt-get upgrade -y

RUN apt-get install php php7.4-fpm php-mysql -y

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp


COPY ./tools/scrpt.bash /
RUN chmod +x /scrpt.bash && chmod +rwx /usr/local/bin/wp

EXPOSE 9000

CMD ["bash", "/scrpt.bash"]
