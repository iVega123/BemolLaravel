FROM php:7.4.16-fpm-buster
RUN apt-get update -y && apt-get install -y libmcrypt-dev openssl
RUN pecl install mcrypt-1.0.3
RUN command docker-php-ext-enable mcrypt
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /app
COPY . /app
RUN composer install

CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000