FROM nextcloud:fpm-alpine
MAINTAINER bulzipke <bulzipke@naver.com>

RUN apk update && apk upgrade && \
	apk add -t temp autoconf build-base samba-dev && \
	apk add libsmbclient && \
	pecl install smbclient && \
	docker-php-ext-enable smbclient && \
	apk del temp

