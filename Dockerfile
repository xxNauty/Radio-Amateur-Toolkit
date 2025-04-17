FROM php:8.3-apache

RUN apt-get update &&  \
    apt-get install -y \
    git  \
    unzip  \
    libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql && \
    a2enmod rewrite && \
    a2enmod dir

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

#RUN git config --global --add safe.directory /var/www/html

# katalog roboczy
WORKDIR /var/www/html

RUN echo "DirectoryIndex public/index.php public/index.html" >> /etc/apache2/apache2.conf

# kopiowanie plików do kontenera
COPY . .


RUN composer install --no-dev --optimize-autoloader --no-scripts

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html/

USER www-data

EXPOSE 80

CMD ["apache2-foreground"]