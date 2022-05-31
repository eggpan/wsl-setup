FROM httpd:2.4

RUN apt-get update \
    && apt-get install -y ssl-cert \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
RUN mkdir -p /var/www/html
