# docker-nextcloud
Nextcloud Docker image based on Wonderfall/docker-nextcloud with rclone mount

This image is just for me.

# How to use this Image
```console
$ docker run \
--cap-add SYS_ADMIN \
--device /dev/fuse \
--security-opt apparmor:unconfined \
--link mariadb:mariadb --link redis:redis \
-v /your_path/config:/config \
-v /your_path/apps:/apps2 \
-v /your_path/themes:/nextcloud/thmes \
-v /your_path/rclone:/rclone \
-e UID=1000 -e GID=1000 \
-e RemotePath="YourRcloneDrive:" \
-e MountPoint="/data" \
-e MountCommands="--allow-other --allow-non-empty --uid 1000 --gid 1000 --vfs-cache-mode writes" \
-e DOMAIN=cloud.yourhost.com \
-d bulzipke/nextcloud:latest
```


