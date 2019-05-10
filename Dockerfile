FROM nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV ConfigDir="/rclone" \
    ConfigName=".rclone.conf" \
    UnmountCommands="-u -z"

RUN apt-get update
RUN apt-get install -y fuse unzip gosu

RUN sed -i "2i/mount.sh &" /entrypoint.sh
RUN sed -i "6iListen 8080" /etc/apache2/ports.conf
RUN sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf
RUN sed -i 's/memory_limit.*/memory_limit=-1/g' /usr/local/etc/php/conf.d/memory-limit.ini
RUN sed -i 's/interned_strings_buffer.*/interned_strings_buffer=16/g' /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN sed -i 's/memory_consumption.*/memory_consumption=256/g' /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN sed -i 's/revalidate_freq.*/revalidate_freq=60/g' /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN echo apc.shm_size=256M >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

WORKDIR /root
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
RUN unzip rclone-current-linux-amd64.zip
RUN mv rclone-*-linux-amd64/rclone /usr/bin/
RUN rm -rf rclone*
RUN chown root:root /usr/bin/rclone
RUN chmod 755 /usr/bin/rclone

RUN mkdir -p /data

COPY rootfs /
RUN ln -s /etc/apache2/sites-available/001-download.conf /etc/apache2/sites-enabled/

