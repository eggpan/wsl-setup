FROM alpine:3.16

ARG TIMEZONE="UTC"
ARG WWWUSER="nobody"
ARG WWWGROUP="nobody"

RUN apk add --no-cache \
        php81 \
        php81-bcmath \
        php81-curl \
        php81-dev \
        php81-fpm \
        php81-gd \
        php81-imap \
        php81-intl \
        php81-mbstring \
        php81-mysqli \
        php81-mysqlnd \
        php81-opcache \
        php81-pdo \
        php81-pdo_mysql \
        php81-pdo_pgsql \
        php81-pdo_sqlite \
        php81-pecl-igbinary \
        php81-pecl-memcached \
        php81-pecl-msgpack \
        php81-pecl-redis \
        php81-pecl-swoole \
        php81-pecl-xdebug \
        php81-pgsql \
        php81-phar \
        php81-soap \
        php81-sqlite3 \
        php81-xml \
        php81-zip

RUN sed -ri \
        "s#^;(date.timezone).*#\1 = ${TIMEZONE}#; \
        s/^(error_reporting).+/\1 = E_ALL/; \
        s/^(display_errors).+/\1 = On/; \
        s#;(error_log).+#\1 = /proc/self/fd/2#; \
        s/^;(fastcgi.logging = 0)/\1/;" /etc/php81/php.ini \
    && sed -ri "s/(user =) nobody/\1 ${WWWUSER}/; \
        s/(group =) nobody/\1 ${WWWGROUP}/; \
        s/^(listen).+/\1 = 9000/;" /etc/php81/php-fpm.d/www.conf \
    && ln -s php81 /usr/bin/php

COPY docker.conf /etc/php81/php-fpm.d/docker.conf

WORKDIR /app/home/public_html
EXPOSE 9000

CMD ["php-fpm81", "--nodaemonize"]
