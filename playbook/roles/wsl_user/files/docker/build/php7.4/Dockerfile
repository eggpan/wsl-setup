FROM alpine:3.15

ARG TIMEZONE="UTC"
ARG WWWUSER="nobody"
ARG WWWGROUP="nobody"

RUN apk add --no-cache \
        php7 \
        php7-bcmath \
        php7-curl \
        php7-dev \
        php7-dom \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-imap \
        php7-intl \
        php7-mbstring \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pecl-igbinary \
        php7-pecl-memcached \
        php7-pecl-msgpack \
        php7-pecl-redis \
        php7-pecl-xdebug \
        php7-pgsql \
        php7-phar \
        php7-soap \
        php7-sqlite3 \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip

RUN sed -ri \
        "s#^;(date.timezone).*#\1 = ${TIMEZONE}#; \
        s/^(error_reporting).+/\1 = E_ALL/; \
        s/^(display_errors).+/\1 = On/; \
        s#;(error_log).+#\1 = /proc/self/fd/2#; \
        s/^;(fastcgi.logging = 0)/\1/;" /etc/php7/php.ini \
    && sed -ri "s/(user =) nobody/\1 ${WWWUSER}/; \
        s/(group =) nobody/\1 ${WWWGROUP}/; \
        s/^(listen).+/\1 = 9000/;" /etc/php7/php-fpm.d/www.conf

COPY docker.conf /etc/php7/php-fpm.d/docker.conf

WORKDIR /app/home/public_html
STOPSIGNAL SIGQUIT
EXPOSE 9000

CMD ["php-fpm7", "--nodaemonize"]
