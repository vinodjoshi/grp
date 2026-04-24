FROM php:8.3-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    nginx \
    bash \
    curl \
    git \
    zip \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    icu-dev \
    libzip-dev \
    oniguruma-dev \
    libxml2-dev \
    nodejs \
    npm

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd intl zip

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/grp

# Copy composer files first (cache optimization)
COPY application/composer.* ./
RUN composer install --no-interaction --prefer-dist

# Copy full Laravel app
COPY application/ .

# Copy nginx config
COPY nginx/default.conf /etc/nginx/http.d/default.conf

# Fix permissions (IMPORTANT FIX)
RUN chown -R www-data:www-data /var/www/grp \
    && chmod -R 775 storage bootstrap/cache

# Expose port
EXPOSE 80

# Healthcheck (optional but good)
HEALTHCHECK CMD curl -f http://localhost || exit 1

# Start services
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]