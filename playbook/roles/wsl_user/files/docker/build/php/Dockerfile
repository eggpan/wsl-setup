ARG INSTALL_PHP_VERSION=8.1

FROM php:${INSTALL_PHP_VERSION}-fpm

ARG INSTALL_XDEBUG_VERSION="xdebug"
ARG TIMEZONE="UTC"

RUN apt-get update \
    && apt-get install -y \
       libcurl4-openssl-dev \
       libfreetype6-dev \
       libicu-dev \
       libjpeg62-turbo-dev \
       libmemcached-dev \
       libpng-dev \
       libpq-dev \
       libsqlite3-dev \
       libwebp-dev \
       libzip-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader xmlwriter xsl zend_test zip
RUN docker-php-ext-install -j$(nproc) \
       bcmath curl gd intl mysqli opcache \
       pdo pdo_mysql pdo_pgsql pdo_sqlite pgsql zip

RUN pecl install memcached \
    && pecl install redis \
    && pecl install ${INSTALL_XDEBUG_VERSION} \
    && docker-php-ext-enable xdebug

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
    && sed -i "s#^;date.timezone =.*#date.timezone = ${TIMEZONE}#" /usr/local/etc/php/php.ini

WORKDIR /app/home/public_html
