FROM php:7.2.10-fpm-alpine3.8

ADD /vendor /var/www/html/vendor
ADD /src /var/www/html/src
ADD /public /var/www/html/public

EXPOSE 9000
