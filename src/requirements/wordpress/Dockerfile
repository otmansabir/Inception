FROM debian:buster

RUN apt update 
RUN apt upgrade -y
RUN apt -y install wget
RUN apt install -y php7.3 php-fpm php-mysql mariadb-client 
RUN mkdir -p /var/www 
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/auto_config.sh



CMD ["bash", "/usr/local/bin/auto_config.sh"]