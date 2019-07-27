# docker-nextcloud
[![](https://images.microbadger.com/badges/version/bulzipke/nextcloud.svg)](https://microbadger.com/images/bulzipke/nextcloud) [![](https://images.microbadger.com/badges/image/bulzipke/nextcloud.svg)](https://microbadger.com/images/bulzipke/nextcloud)

Nextcloud Docker image based on Wonderfall/docker-nextcloud

This image is just for me.

# How to use this Image
```console
$ docker run \
--link mariadb:mariadb --link redis:redis \
-v /your_path/config:/config \
-v /your_path/apps:/apps2 \
-v /your_path/themes:/nextcloud/thmes \
-v /your_path/rclone:/rclone \
-e UID=1000 -e GID=1000 \
-e DOMAIN=cloud.yourhost.com \
-d bulzipke/nextcloud:latest
```


