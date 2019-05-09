FROM nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV ConfigDir="/rclone" \
    ConfigName=".rclone.conf" \
    UnmountCommands="-u -z" \
    OCC_MEMORY_LIMIT=1g \
    CRON_MEMORY_LIMIT=1g

RUN apt-get update
RUN apt-get install -y fuse unzip gosu

RUN sed -i "2i/mount.sh &" /entrypoint.sh
RUN sed -i "6iListen 8080" /etc/apache2/ports.conf
RUN sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

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

