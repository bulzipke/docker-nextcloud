FROM nextcloud:fpm-alpine
MAINTAINER bulzipke <bulzipke@naver.com>

RUN apk update && apk upgrade
RUN apk add -t temp
RUN apk add autoconf build-base samba-dev libsmbclient
RUN pecl install smbclient
RUN docker-php-ext-enable smbclient
RUN apk del temp

COPY scripts/* /root/
CMD ["/root/setup.sh"]

# RUN sed -i s/upload_max_filesize.*/upload_max_filesize=16G/g /var/www/html/.user.ini
# RUN sed -i s/post_max_size.*/post_max_size=16G/g /var/www/html/.user.ini

