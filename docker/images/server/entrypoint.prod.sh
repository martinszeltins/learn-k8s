#!/bin/sh
set -e

cd /app

# Copy .env from example if it doesn't exist
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Generate APP_KEY if not set
if ! grep -q '^APP_KEY=.\+' .env 2>/dev/null; then
    php artisan key:generate
fi

# Start PHP-FPM in background
php-fpm &

# Start nginx in foreground
exec nginx -g 'daemon off;'
