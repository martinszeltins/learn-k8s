#!/bin/sh
set -e

cd /app

php-fpm &

exec nginx -g 'daemon off;'