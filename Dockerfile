FROM nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV ConfigDir="/rclone" \
    ConfigName=".rclone.conf" \
    UnmountCommands="-u -z"

ADD rootfs /

RUN apt-get update && apt-get install -y fuse unzip gosu && \
    sed -i "2i/mount.sh &" /entrypoint.sh && \
    sed -i "6iListen 8080" /etc/apache2/ports.conf && \
    sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf && \
    sed -i 's/memory_limit.*/memory_limit=-1/g' /usr/local/etc/php/conf.d/memory-limit.ini && \
    sed -i 's/interned_strings_buffer.*/interned_strings_buffer=16/g' /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    sed -i 's/memory_consumption.*/memory_consumption=256/g' /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    sed -i 's/revalidate_freq.*/revalidate_freq=60/g' /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo apc.shm_size=256M >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini && \
    mkdir -p /data && \
    ln -s /etc/apache2/sites-available/001-download.conf /etc/apache2/sites-enabled/

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    mv rclone-*-linux-amd64/rclone /usr/bin/ && \
    rm -rf rclone* && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone
