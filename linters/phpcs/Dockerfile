FROM php:7.2

# Install apt dependencies
RUN apt-get update && apt-get install -qq -y --fix-missing --no-install-recommends \
    git \
    unzip \
    zip \
    ;

# Install composer.
RUN curl https://getcomposer.org/installer -s -o composer-setup.php \
    && php composer-setup.php --quiet --install-dir=/usr/local/bin/ --filename=composer \
    && rm composer-setup.php

# Install phpcs and code standards libraries via Composer
COPY ./composer.json /composer/
RUN composer install -d "/composer"

WORKDIR /workspace
ENTRYPOINT ["/composer/vendor/bin/phpcs", "-s"]
