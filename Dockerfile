# ─────────────────────────────────────────────
# Stage 1: Build frontend (Node)
# ─────────────────────────────────────────────
FROM node:20-alpine AS frontend

WORKDIR /app

# Install dependencies (better caching)
COPY application/package*.json ./
RUN npm install

# Copy full frontend code
COPY application/ .

# Build assets
RUN npm run build


# ─────────────────────────────────────────────
# Stage 2: PHP + Laravel
# ─────────────────────────────────────────────
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
    libxml2-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd intl zip

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/grp

# Copy FULL Laravel app first (IMPORTANT FIX)
COPY application/ .

# Install PHP dependencies (artisan now exists ✅)
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Copy built frontend assets (IMPORTANT)
COPY --from=frontend /app/public ./public

# Fix permissions (VERY IMPORTANT)
RUN chown -R www-data:www-data /var/www/grp \
    && chmod -R 775 storage bootstrap/cache

# Copy nginx config
COPY nginx/default.conf /etc/nginx/http.d/default.conf

# Expose port
EXPOSE 80

# Start services
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]