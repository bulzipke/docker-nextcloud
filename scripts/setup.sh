#! /bin/sh

sed -i s/upload_max_filesize.*/upload_max_filesize=15G/g /var/www/html/.user.ini
sed -i s/post_max_size.*/post_max_size=15G/g /var/www/html/.user.ini

