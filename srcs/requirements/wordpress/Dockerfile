FROM debian:bullseye

# Update and upgrade system packages
RUN apt-get update && apt-get upgrade -y

# Install required packages
RUN apt-get install -y php php7.4-fpm php-mysql curl

# Download wp-cli.phar directly
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

# Make wp-cli executable
RUN chmod +x /usr/local/bin/wp

# Copy your script into the container
COPY ./tools/script.sh /

# Make the script executable
RUN chmod +x /script.sh

# Expose the required port
EXPOSE 9000

# Set the script as the container's entry point
CMD ["/script.sh"]
