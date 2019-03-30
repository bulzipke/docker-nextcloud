FROM wonderfall/nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV ConfigDir="/rclone" \
    ConfigName=".rclone.conf" \
    UnmountCommands="-u -z"

## Alpine with Go Git
RUN apk add --no-cache --update alpine-sdk ca-certificates go git fuse fuse-dev \
    && go get -u -v github.com/ncw/rclone \
    && cp /root/go/bin/rclone /usr/sbin/ \
    && rm -rf /root/go \
    && apk del alpine-sdk go git \
    && rm -rf /tmp/* /var/cache/apk/* /var/lib/apk/lists/*

RUN sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

RUN mkdir /.cache
RUN chmod 777 /.cache

COPY rootfs /

