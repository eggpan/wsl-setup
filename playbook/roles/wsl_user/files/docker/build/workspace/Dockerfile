FROM alpine:3.16

RUN apk add --no-cache \
        bash \
        curl \
        git \
        go \
        mariadb-client \
        mariadb-connector-c \
        npm \
        php81 \
        php81-bcmath \
        php81-curl \
        php81-dev \
        php81-dom \
        php81-fileinfo \
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
        php81-tokenizer \
        php81-xml \
        php81-xmlreader \
        php81-xmlwriter \
        php81-zip \
        tzdata \
    && ln -s /usr/bin/php81 /usr/bin/php \
    && curl -s http://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN adduser -s /bin/bash -D user
USER user
WORKDIR /app/home

CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]
