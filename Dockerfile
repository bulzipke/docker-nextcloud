FROM nextcloud:fpm-alpine:latest
MAINTAINER bulzipke <bulzipke@naver.com>

RUN apk update && apk upgrade
RUN apk add -t temp
RUN apk add autoconf build-base samba-dev libsmbclient
RUN pecl install smbclient
RUN docker-php-ext-enable smbclient
RUN apk del temp

COPY scripts/* /root/
CMD ["/root/setup.sh"]

