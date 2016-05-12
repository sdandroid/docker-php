FROM php:apache
MAINTAINER Bin Gao
ENV PHPREDIS_VERSION=php7
RUN cd /usr/src/php/ext \
    && curl -q https://codeload.github.com/phpredis/phpredis/tar.gz/$PHPREDIS_VERSION | tar -xz \
    && docker-php-ext-install phpredis-$PHPREDIS_VERSION 
RUN a2enmod rewrite
EXPOSE 80
CMD ["apache2-foreground"]
