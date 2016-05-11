FROM php:apache
RUN a2enmod rewrite
EXPOSE 80
CMD ["apache2-foreground"]
