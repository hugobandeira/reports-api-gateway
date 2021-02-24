FROM php:7.4-fpm-alpine
RUN apk add --no-cache shadow openssl bash mysql-client alpine-sdk autoconf nano nginx openrc supervisor sqlite

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.9.6 \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo pdo_mysql bcmath
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis

WORKDIR /var/www
RUN rm -rf /var/www/html
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

RUN rm /etc/nginx/conf.d/default.conf
COPY .docker/nginx/nginx.conf /etc/nginx/conf.d
COPY .docker/supervisord.conf /etc/supervisord.conf
COPY . .
COPY .docker/git-hook-pre-push.sh /var/www/.git/hooks/pre-push

RUN usermod -u 1000 www-data
RUN chmod -R 775 /var/www/storage
RUN chown -R www-data:www-data /var/www/

EXPOSE 80

ENTRYPOINT ["supervisord"]
