#! /bin/sh

while true; do
  php -f /var/www/html/cron.php
  sleep 15m
done

