# docker-nextcloud
Nextcloud Docker image based on fpm-Alpine Linux with smb

This image is just for me.

# How to use this Image
```console
$ docker run \
--link mariadb:mariadb --link redis:redis \
-v /your_path:/var/www/html \
-d bulzipke/nextcloud
```


