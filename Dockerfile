FROM php:apache
MAINTAINER Bin Gao
RUN curl -L https://pecl.php.net/get/redis-2.2.7.tgz >> /usr/src/php/ext/redis.tgz \
&& tar -xf /usr/src/php/ext/redis.tgz -C /usr/src/php/ext/ \
&& rm /usr/src/php/ext/redis.tgz \
&& docker-php-ext-install redis-2.2.7 \
RUN a2enmod rewrite
EXPOSE 80
CMD ["apache2-foreground"]
