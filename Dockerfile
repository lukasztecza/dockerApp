FROM php:7.2-fpm

RUN apt-get update
RUN apt-get install -y vim curl
ADD /vendor /var/www/html/vendor
ADD /src /var/www/html/src
ADD /public /var/www/html/public

EXPOSE 9000
