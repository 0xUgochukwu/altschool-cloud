FROM php:8.1-apache-bullseye

ARG user
ARG uid

# 1. Install development packages and clean up apt cache.
RUN apt-get update && apt-get install -y \
    curl \
    g++ \
    git \
    libbz2-dev \
    apache2 \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libxml2-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libpng-dev \
    libreadline-dev \
    libxslt-dev \
    libzip-dev \
    sudo \
    unzip \
    zip \
 && rm -rf /var/lib/apt/lists/*


# 2. Apache configs + document root.
RUN echo "ServerName laravel-app.local" >> /etc/apache2/apache2.conf

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers

# 4. Start with base PHP config, then add extensions.
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-configure intl; \
    docker-php-ext-install -j$(nproc) \
      bcmath \
      bz2 \
      calendar \
      exif \
      gd \
      gettext \
      intl \
      mysqli  \
      opcache \
      pdo_mysql \
      soap \
      sockets \
      xsl \
      zip

# 5. Composer.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 6. We need a user with the same UID/GID as the host user
# so when we execute CLI commands, all the host file's permissions and ownership remain intact.
# Otherwise commands from inside the container would create root-owned files and directories.
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

USER $user
