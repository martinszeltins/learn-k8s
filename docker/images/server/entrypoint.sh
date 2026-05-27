#!/bin/sh
set -e

cd /app

# Install dependencies if autoloader is missing
if [ ! -f vendor/autoload.php ]; then
    composer install --no-interaction --no-progress
fi

# Copy .env from example if it doesn't exist
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Generate APP_KEY if not set
if ! grep -q '^APP_KEY=.\+' .env 2>/dev/null; then
    php artisan key:generate
fi

# Create SQLite database if it doesn't exist
mkdir -p database
touch database/database.sqlite

# Run migrations
php artisan migrate --force

# Start PHP-FPM in background
php-fpm &

# Start nginx in foreground
exec nginx -g 'daemon off;'
