FROM php:7.4-cli
RUN apt-get update
RUN apt-get install -y docker-php-ext-install 

RUN pecl install redis-5.1.1 \
	&& pecl install xdebug-2.8.1 \
	&& docker-php-ext-enable redis xdebug

