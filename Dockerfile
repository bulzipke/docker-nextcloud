FROM nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV UID=1000
ENV GID=1000

ADD rootfs /

RUN sed -i "6iListen 8080" /etc/apache2/ports.conf && \
    sed -i "2iusermod -o -u "$UID" www-data" /entrypoint.sh && \
    sed -i "3igroupmod -o -g "$GID" www-data" /entrypoint.sh && \
    sed -i 's/memory_limit.*/memory_limit=-1/g' /usr/local/etc/php/conf.d/memory-limit.ini && \
    sed -i 's/interned_strings_buffer.*/interned_strings_buffer=16/g' /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    sed -i 's/memory_consumption.*/memory_consumption=256/g' /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    sed -i 's/revalidate_freq.*/revalidate_freq=60/g' /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo apc.shm_size=256M >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini && \
    ln -s /etc/apache2/sites-available/001-download.conf /etc/apache2/sites-enabled/
