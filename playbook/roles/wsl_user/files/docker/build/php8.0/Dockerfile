FROM alpine:3.16

ARG TIMEZONE="UTC"
ARG WWWUSER="nobody"
ARG WWWGROUP="nobody"

RUN apk add --no-cache \
        php8 \
        php8-bcmath \
        php8-curl \
        php8-dev \
        php8-dom \
        php8-fileinfo \
        php8-fpm \
        php8-gd \
        php8-imap \
        php8-intl \
        php8-mbstring \
        php8-mysqli \
        php8-mysqlnd \
        php8-opcache \
        php8-pdo \
        php8-pdo_mysql \
        php8-pdo_pgsql \
        php8-pdo_sqlite \
        php8-pecl-igbinary \
        php8-pecl-memcached \
        php8-pecl-msgpack \
        php8-pecl-redis \
        php8-pecl-swoole \
        php8-pecl-xdebug \
        php8-pgsql \
        php8-phar \
        php8-soap \
        php8-sqlite3 \
        php8-tokenizer \
        php8-xml \
        php8-xmlreader \
        php8-xmlwriter \
        php8-zip

RUN sed -ri \
        "s#^;(date.timezone).*#\1 = ${TIMEZONE}#; \
        s/^(error_reporting).+/\1 = E_ALL/; \
        s/^(display_errors).+/\1 = On/; \
        s#;(error_log).+#\1 = /proc/self/fd/2#; \
        s/^;(fastcgi.logging = 0)/\1/;" /etc/php8/php.ini \
    && sed -ri "s/(user =) nobody/\1 ${WWWUSER}/; \
        s/(group =) nobody/\1 ${WWWGROUP}/; \
        s/^(listen).+/\1 = 9000/;" /etc/php8/php-fpm.d/www.conf

COPY docker.conf /etc/php8/php-fpm.d/docker.conf

WORKDIR /app/home/public_html
STOPSIGNAL SIGQUIT
EXPOSE 9000

CMD ["php-fpm8", "--nodaemonize"]
