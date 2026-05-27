FROM php:8.4-fpm

# Install nginx and PHP extensions needed by Laravel
RUN apt-get update && apt-get install -y \
    nginx \
    unzip \
    libsqlite3-dev \
    && docker-php-ext-install pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Configure PHP-FPM to run without user/group directives (non-root)
RUN sed -i 's/^user = .*/;user = nobody/' /usr/local/etc/php-fpm.d/www.conf \
    && sed -i 's/^group = .*/;group = nobody/' /usr/local/etc/php-fpm.d/www.conf

# Copy nginx config
COPY docker/images/server/nginx.conf /etc/nginx/nginx.conf

# Prepare directories for non-root user
RUN mkdir -p /var/cache/nginx /var/log/nginx /tmp \
    && chmod -R 777 /var/cache/nginx /var/log/nginx /var/run /tmp

# Copy entrypoint
COPY docker/images/server/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
