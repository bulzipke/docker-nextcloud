FROM wonderfall/nextcloud:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV ConfigName=".rclone.conf" \
    UnmountCommands="-u -z"

## Alpine with Go Git
RUN apk add --no-cache --update alpine-sdk ca-certificates go git fuse fuse-dev \
    && go get -u -v github.com/ncw/rclone \
    && cp /go/bin/rclone /usr/sbin/ \
    && rm -rf /go \
    && apk del alpine-sdk go git \
    && rm -rf /tmp/* /var/cache/apk/* /var/lib/apk/lists/*

COPY rootfs /

