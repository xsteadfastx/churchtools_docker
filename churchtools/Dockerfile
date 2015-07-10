FROM ubuntu:14.04

# install dependencies
RUN apt-get update \
    && apt-get install -y \
    git \
    python \
    python-dev \
    python-pip \
    python-mysqldb \
    apache2 \
    libapache2-mod-php5 \
    php5-mysql \
    php5-gd \
    php-pear \
    php-apc \
    php5-curl \
    curl \
    && pip install ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# apache
RUN a2enmod php5
RUN a2enmod rewrite
RUN a2enmod headers

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# php
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php5/apache2/php.ini

# copy files
COPY ansible /tmp/ansible
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf

VOLUME ["/var/www"]

EXPOSE 80
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
