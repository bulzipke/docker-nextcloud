FROM nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV ConfigDir="/rclone" \
    ConfigName=".rclone.conf" \
    UnmountCommands="-u -z"

RUN apt-get install rclone fuse

RUN sed -i "2i/mount.sh &" /entrypoint.sh
RUN sed -i "3i" /entrypoint.sh
RUN sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

# RUN echo "nextcloud:x:1000:1000:nextcloud:/root:/sbin/nologin" >> /etc/passwd
# RUN echo "nextcloud:x:1000:" >> /etc/group

# RUN mkdir -p /root/.cache
# RUN chmod 777 /root/.cache

COPY *.sh /

