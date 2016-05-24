FROM php:apache
MAINTAINER Bin Gao
ENV PHPREDIS_VERSION=php7
RUN cd /usr/src/php/ext \
    && curl -q https://codeload.github.com/phpredis/phpredis/tar.gz/$PHPREDIS_VERSION | tar -xz \
    && docker-php-ext-install phpredis-$PHPREDIS_VERSION
RUN docker-php-ext-install pdo pdo_mysql 
RUN a2enmod rewrite
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) mcrypt
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

EXPOSE 80
CMD ["apache2-foreground"]
