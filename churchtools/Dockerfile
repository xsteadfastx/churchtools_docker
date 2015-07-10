FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y \
    git \
    python \
    python-dev \
    python-pip \
    python-mysqldb \
    supervisor \
    nginx \
    php5-fpm \
    php5-mysql \
    && pip install ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/log/supervisor

RUN git clone https://github.com/churchtools/churchtools_basic.git /var/www \
    && cd /var/www \
    && git checkout tags/v2.56

RUN chown -Rv www-data:www-data /var/www

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

COPY ansible /tmp/ansible
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

VOLUME ["/var/www/sites/default"]

EXPOSE 80
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
